{ system ? builtins.currentSystem
, config ? {}
, pkgs ? import (import ./nix/pkgs-src.nix) { inherit system config; }
}:

with import "${import ./nix/pkgs-src.nix}/nixos/lib/testing-python.nix" { inherit system pkgs; };
with pkgs.lib;
let
  overlay-src = ../.;
  listenPort = 3333;
in
makeTest {
  name = "zfs-remote-keyloader";

  nodes = {
    server = { pkgs, lib, ... }: {
      imports = [
        overlay-src
      ];
      virtualisation.emptyDiskImages = [ 128 ];

      boot.supportedFilesystems = [ "zfs" ];

      networking.hostId = "00000000";
      networking.firewall.allowedTCPPorts = [ listenPort ];

      environment.systemPackages = with pkgs;
        [
          gptfdisk
          zfsUnstable
          zfs-remote-keyloader
        ];
    };

    client = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.curl ];
    };
  };

  testScript =
    let
      zfsEncryptionKey = "password";
      zfsPool = "rpool";
    in
      ''
        server.start()
        client.start()

        server.wait_for_unit("multi-user.target")
        server.succeed("modprobe zfs")
        server.succeed(
            "udevadm settle",
            "sgdisk --zap-all /dev/vdb",
            "echo ${zfsEncryptionKey} | zpool create"
            + " -O mountpoint=none"
            + " -O encryption=aes-256-gcm"
            + " -O keyformat=passphrase"
            + " ${zfsPool} vdb",
            "zfs unload-key ${zfsPool}",
        )

        server.succeed("zfs get -H -o value keystatus ${zfsPool} | grep unavailable")

        server.succeed("zfs-remote-keyloader --help")
        server.execute("zfs-remote-keyloader --listen 0.0.0.0:${toString listenPort} --zfs-dataset ${zfsPool} &")
        server.wait_for_open_port(${toString listenPort})

        client.wait_for_unit("multi-user.target")
        client.succeed("curl http://server:${toString listenPort}/ >&2")
        client.succeed("curl -X POST -d 'key=${zfsEncryptionKey}' http://server:${toString listenPort}/loadkey")

        # Wait for the service to shut down
        server.wait_until_fails("pidof zfs-remote-keyloader")

        # Make sure the key was loaded successfully
        server.succeed("zfs get -H -o value keystatus ${zfsPool} | grep available")
      '';
}
