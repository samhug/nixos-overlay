{ system ? builtins.currentSystem
, config ? {}
, pkgs ? import <nixpkgs> { inherit system config; }
}:

# This test is largly based off of https://github.com/NixOS/nixpkgs/blob/master/nixos/tests/installer.nix

with import "${pkgs.path}/nixos/lib/testing-python.nix" { inherit system pkgs; };
with pkgs.lib;

let
  overlay-src = ../.;
  overlay-archive = pkgs.runCommand "overlay-archive" {}
    ''
      mkdir -p $out
      cd ${overlay-src}
      tar -czf $out/overlay-archive.tar.gz *
    '';
in
makeTest {
  name = "zfs-remote-keyloader-initrd";
  nodes = {

    # The configuration of the machine used to run "nixos-install".
    machine =
      { pkgs, ... }:

        {
          imports =
            [
              "${import ./nix/pkgs-src.nix}/nixos/modules/profiles/installation-device.nix"
              "${import ./nix/pkgs-src.nix}/nixos/modules/profiles/base.nix"
              overlay-src
            ];

          virtualisation.diskSize = 8 * 1024;
          virtualisation.memorySize = 1024;

          # Use a small /dev/vdb as the root disk for the
          # installer. This ensures the target disk (/dev/vda) is
          # the same during and after installation.
          virtualisation.emptyDiskImages = [ 512 ];
          virtualisation.bootDevice = "/dev/vdb";
          virtualisation.qemu.diskInterface = "virtio";

          boot.loader.systemd-boot.enable = true;
          boot.supportedFilesystems = [ "zfs" ];
          boot.zfs.enableUnstable = true;

          hardware.enableAllFirmware = mkForce false;

          # The test cannot access the network, so any packages we
          # need must be included in the VM.
          system.extraDependencies = with pkgs;
            [
              sudo
              libxml2.bin
              libxslt.bin
              desktop-file-utils
              docbook5
              docbook_xsl_ns
              unionfs-fuse
              ntp
              nixos-artwork.wallpapers.simple-dark-gray-bottom
              perlPackages.XMLLibXML
              perlPackages.ListCompare
              shared-mime-info
              texinfo
              xorg.lndir

              mkinitcpio-nfs-utils
              zfs-remote-keyloader

              # add curl so that rather than seeing the test attempt to download
              # curl's tarball, we see what it's trying to download
              curl
            ];

          nix.binaryCaches = mkForce [];
          nix.extraOptions =
            ''
              hashed-mirrors =
              connect-timeout = 1
            '';
        };

    client = { pkgs, ... }: {
      networking = {
        useDHCP = false;
        defaultGateway = "10.0.2.2";
        interfaces.eth0.ipv4.addresses = mkOverride 0 [
          { address = "10.0.2.20"; prefixLength = 24; }
        ];
      };
      environment.systemPackages = with pkgs; [
        curl
        netcat
      ];
    };

  };

  # The test script boots a NixOS VM, installs NixOS on an empty hard
  # disk, and then reboot from the hard disk.
  testScript = { nodes, ... }:
    let
      # machineConfig = pkgs.writeText "machine-config.json" (builtins.toJSON ({
      #   name = "boot-after-install";
      #   # FIXME don't duplicate the -enable-kvm etc. flags here yet again!
      #   qemuFlags =
      #     (if system == "x86_64-linux" then "-m 768 " else "-m 512 ") +
      #     (optionalString (system == "x86_64-linux") "-cpu kvm64 ") +
      #     (optionalString (system == "aarch64-linux") "-enable-kvm -machine virt,gic-version=host -cpu host ");

      #   hda = "vm-state-machine/machine.qcow2";
      #   hdaInterface = "virtio";
      #   bios = if pkgs.stdenv.isAarch64
      #     then "${pkgs.OVMF.fd}/FV/QEMU_EFI.fd"
      #     else "${pkgs.OVMF.fd}/FV/OVMF.fd";
      # }));

      zfsEncryptionKey = "password";
      zfsPoolName = "rpool";
      listenPort = 3333;

      # The configuration to install.
      configuration = pkgs.writeText "configuration.nix"
        ''
          { config, lib, pkgs, modulesPath, ... }:
    
          { imports =
              [ ./hardware-configuration.nix
                <nixpkgs/nixos/modules/testing/test-instrumentation.nix>
                ./overlay
              ];
    
            # To ensure that we can rebuild the grub configuration on the nixos-rebuild
            system.extraDependencies = with pkgs; [ stdenvNoCC ];
    
            boot.loader.systemd-boot.enable = true;

            boot.supportedFilesystems = [ "zfs" ];
            boot.zfs.enableUnstable = true;
            boot.zfs.requestEncryptionCredentials = true;

            boot.kernelParams = [
              "ip=${nodes.machine.config.networking.primaryIPAddress}:::255.255.255.0::eth1:none"
            ];
            boot.initrd.network.enable = true;
            boot.initrd.zfs-remote-keyloader = {
              enable = true;
              zfsDataset = "${zfsPoolName}";
              listenAddr = "0.0.0.0:${toString listenPort}";
            };

            # Using by-uuid overrides the default of by-id, and is unique
            # to the qemu disks, as they don't produce by-id paths for
            # some reason.
            boot.zfs.devNodes = "/dev/disk/by-uuid/";
            networking.hostId = "00000000";

            networking.interfaces.eth1 = {
              ipv4.addresses = [
                {
                  address = "${(head nodes.machine.config.networking.interfaces.eth1.ipv4.addresses).address}";
                  prefixLength = 24;
                }
              ];
            };

            users.users.alice = {
              isNormalUser = true;
              home = "/home/alice";
              description = "Alice Foobar";
            };
    
            hardware.enableAllFirmware = lib.mkForce false;
          }
        '';

    in
      ''
        def copy_file_from_host(machine: Machine, from_path: str, to_path: str) -> None:
            """Copy a file to the machine.
            """
            import base64

            with open(from_path, "rb") as f:
                content = base64.b64encode(f.read())
                machine.succeed("echo '{}' | base64 -d > {}".format(content.decode(), to_path))


        machine.start()
        machine.wait_for_unit("multi-user.target")

        # Wait for hard disks to appear in /dev
        machine.succeed("udevadm settle")

        # Partition the disk.
        machine.succeed(
            "flock /dev/vda parted --script /dev/vda -- mklabel gpt"
            " mkpart ESP fat32 1M 50MiB"  # /boot
            " set 1 boot on"
            " mkpart primary linux-swap 50MiB 1024MiB"
            " mkpart primary 1024MiB -1MiB",  # zfs
            "udevadm settle",
            "mkswap /dev/vda2 -L swap",
            "swapon -L swap",
            "echo ${zfsEncryptionKey} | zpool create -O encryption=aes-256-gcm -O keyformat=passphrase ${zfsPoolName} vda3",
            "zfs create -o mountpoint=legacy ${zfsPoolName}/root",
            "mount -t zfs ${zfsPoolName}/root /mnt",
            "mkfs.vfat -n BOOT /dev/vda1",
            "mkdir -p /mnt/boot",
            "mount LABEL=BOOT /mnt/boot",
            "udevadm settle",
        )

        # Create the NixOS configuration.
        machine.succeed("nixos-generate-config --root /mnt")

        machine.succeed("cat /mnt/etc/nixos/hardware-configuration.nix >&2")

        copy_file_from_host(
            machine,
            "${configuration}",
            "/mnt/etc/nixos/configuration.nix",
        )

        # Copy the overlay archive into the vm and exctract it
        copy_file_from_host(
            machine,
            "${overlay-archive}/overlay-archive.tar.gz",
            "/tmp/overlay-archive.tar.gz",
        )
        machine.succeed(
            "mkdir -p /mnt/etc/nixos/overlay",
            "cd /mnt/etc/nixos/overlay && tar -xzf /tmp/overlay-archive.tar.gz",
        )

        machine.succeed("cat /mnt/etc/nixos/configuration.nix >&2")

        # Perform the installation.
        machine.succeed("nixos-install --show-trace < /dev/null >&2")

        machine.succeed("umount /mnt/boot")
        machine.succeed("umount /mnt")
        machine.succeed("sync")

        machine.shutdown()

        # Now see if we can boot the installation.
        machine_config = {
            "name": "boot-after-install",
            "qemuFlags": "${
      (if system == "x86_64-linux" then "-m 768 " else "-m 512 ") + (optionalString (system == "x86_64-linux") "-cpu kvm64 ") + (optionalString (system == "aarch64-linux") "-enable-kvm -machine virt,gic-version=host -cpu host ") + "-device virtio-net-pci,netdev=vlan1,mac=52:54:00:12:01:02 " + "-netdev vde,id=vlan1,sock=$QEMU_VDE_SOCKET_1 "}",
            "hda": os.path.join(machine.state_dir, "machine.qcow2"),
            "hdaInterface": "virtio",
            "bios": "${
      if pkgs.stdenv.isAarch64
      then "${pkgs.OVMF.fd}/FV/QEMU_EFI.fd"
      else "${pkgs.OVMF.fd}/FV/OVMF.fd" }",
        }
        machine = create_machine(machine_config)

        # Try and boot with encrypted ZFS root
        machine.start()
        client.start()

        # Attempt to send the decription key from the client vm
        client.wait_for_unit("multi-user.target")
        client.wait_until_succeeds("ping -c1 machine >&2")
        client.wait_until_succeeds("nc -zw3 machine ${toString listenPort}")
        client.succeed("curl http://machine:${toString listenPort}/")
        client.succeed("curl -X POST -d 'key=${zfsEncryptionKey}' http://machine:${toString listenPort}/loadkey")

        # Make sure we successfully boot
        machine.wait_for_unit("multi-user.target")

        machine.shutdown()
        client.shutdown()
      '';
}
