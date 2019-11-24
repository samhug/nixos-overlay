{ system ? builtins.currentSystem
, config ? {}
, pkgs ? import (import ./nix/pkgs-src.nix) { inherit system config; }
}:

with import "${import ./nix/pkgs-src.nix}/nixos/lib/testing-python.nix" { inherit system pkgs; };
with pkgs.lib;
let
  overlay-src = ../.;

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
      networking.firewall.allowedTCPPorts = [ 3333 ];

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

        # This should fail if the key isn't loaded
        server.fail("zfs unload-key ${zfsPool}")

        server.succeed("zfs-remote-keyloader --help")
        server.execute("zfs-remote-keyloader server --listen 0.0.0.0:3333 --dataset ${zfsPool} &")
        server.wait_for_open_port(3333)

        client.wait_for_unit("multi-user.target")
        client.succeed("curl http://server:3333/")
        client.succeed("curl -X POST -F 'decryption-key=${zfsEncryptionKey}' http://server:3333/")

        # This should fail if the key is already loaded
        server.fail("zfs load-key ${zfsPool}")

        # This should succeed if the key is already loaded
        server.succeed("zfs unload-key ${zfsPool}")
      '';
}
