# Remote ZFS Unlock module

{ config, lib, pkgs, ... }: with lib;

let
  cfg = config.boot.initrd.network.remote-zfs-unlock;
in
{

  options.boot.initrd.network.remote-zfs-unlock = {

    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Start remote-zfs-unlock service during initrd boot.
      '';
    };

    package = mkOption {
      type = types.package;
      default = pkgs.remote-zfs-unlock;
    };

    ztNetworkId = mkOption {
      type = types.str;
      default = "8056c2e21c000001";
      description = ''
        ZeroTier network id to connect to.
      '';
    };

    #ztHomePath = mkOption {
    #  type = types.nullOr types.path;
    #  default = null;
    #  description = ''
    #    Path to ZeroTier configuration home.
    #  '';
    #};

    ztNodeKey = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = ''
        Path to a file containing the ZeroTier node secret. ($ZT_HOME/identity.secret)
      '';
    };

    sshPort = mkOption {
      type = types.int;
      default = 22;
      description = ''
        Port on which the ZeroTier SSH service should listen.
      '';
    };

    sshShell = mkOption {
      type = types.listOf types.str;
      default = ["zfs" "load-key" "-a"];
      description = ''
        Command to prompt for zfs encryption key.
      '';
    };

    sshHostKey = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = ''
        SSH private key file.
      '';
    };

    sshAuthorizedKeys = mkOption {
      type = types.listOf types.str;
      default = [];
      description = ''
        Authorized keys for SSH login.
      '';
    };

  };

  config = mkIf (config.boot.initrd.network.enable && cfg.enable) {
    assertions = [
      { assertion = cfg.sshAuthorizedKeys != [];
        message = "You should specify at least one authorized key for initrd remote-zfs-unlock";
      }
      { assertion = cfg.ztNodeKey != null;
        message = "You must specify a ztNodeKay";
      }
      { assertion = cfg.sshHostKey != null;
        message = "You must specify a sshHostKey";
      }
    ];

    boot.initrd.extraUtilsCommands = ''
      copy_bin_and_libs ${cfg.package}/bin/remote-zfs-unlock
      mkdir -p $out/etc/remote-zfs-unlock/zt_home
    '';

    #boot.initrd.extraUtilsCommandsTest = ''
    #  $out/bin/remote-zfs-unlock -V
    #'';

    boot.initrd.network.postCommands = ''
      touch /etc/remote-zfs-unlock/config.toml

      echo '[ZeroTier]' >> /etc/remote-zfs-unlock/config.toml
      echo 'network_id = "${cfg.ztNetworkId}"' >> /etc/remote-zfs-unlock/config.toml
      echo 'home_path = "/etc/remote-zfs-unlock/zt_home"' >> /etc/remote-zfs-unlock/config.toml

      echo '[SSH]' >> /etc/remote-zfs-unlock/config.toml
      echo 'listen_port = "${toString cfg.sshPort}"' >> /etc/remote-zfs-unlock/config.toml
      echo 'host_key_path = "/etc/remote-zfs-unlock/ssh_host_key"' >> /etc/remote-zfs-unlock/config.toml

      echo 'authorized_keys = [' >> /etc/remote-zfs-unlock/config.toml
      ${concatStrings (map (key: ''
        echo '  "${escapeShellArg key}",' >> /etc/remote-zfs-unlock/config.toml
      '') cfg.sshAuthorizedKeys)}
      echo ']' >> /etc/remote-zfs-unlock/config.toml

      echo 'shell_command = [' >> /etc/remote-zfs-unlock/config.toml
      ${concatStrings (map (arg: ''
        echo '  "${escapeShellArg arg}",' >> /etc/remote-zfs-unlock/config.toml
      '') cfg.sshShell)}
      echo ']' >> /etc/remote-zfs-unlock/config.toml

      remote-zfs-unlock
    '';

    boot.initrd.secrets =
     (optionalAttrs (cfg.sshHostKey != null) { "/etc/remote-zfs-unlock/ssh_host_key" = cfg.sshHostKey; }) //
     (optionalAttrs (cfg.sshHostKey != null) { "/etc/remote-zfs-unlock/zt_home/identity.secret" = cfg.ztNodeKey; });

  };

}
