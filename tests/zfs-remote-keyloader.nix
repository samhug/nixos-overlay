import <nixpkgs/nixos/tests/make-test.nix> {
  name = "zfs-remote-keyloader";

  nodes = {
    server = { pkgs, lib, ... }: {
      imports = [
        (import ../.)
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
        $server->start;
        $client->start;

        $server->waitForUnit("multi-user.target");
        $server->succeed("modprobe zfs");
        $server->succeed(
          "udevadm settle",
          "sgdisk --zap-all /dev/vdb",
          "echo ${zfsEncryptionKey} | zpool create"
            . " -O mountpoint=none"
            . " -O encryption=aes-256-gcm"
            . " -O keyformat=passphrase"
            . " ${zfsPool} vdb",
          "zfs unload-key ${zfsPool}",
        );

        # This should fail if the key isn't loaded
        $server->fail("zfs unload-key ${zfsPool}");

        $server->succeed("zfs-remote-keyloader --help");
        $server->execute("zfs-remote-keyloader server --listen 0.0.0.0:3333 --dataset ${zfsPool} &");
        $server->waitForOpenPort(3333);

        $client->waitForUnit("multi-user.target");
        $client->succeed("curl http://server:3333/");
        $client->succeed("curl -X POST -F 'decryption-key=${zfsEncryptionKey}' http://server:3333/");

        # This should fail if the key is already loaded
        $server->fail("zfs load-key ${zfsPool}");

        # This should succeed if the key is already loaded
        $server->succeed("zfs unload-key ${zfsPool}");
      '';
}
