# Remote ZFS Unlock module

{ config, lib, pkgs, ... }: with lib;

let
  cfg = config.boot.initrd.zfs-remote-keyloader;
in
{

  options.boot.initrd.zfs-remote-keyloader = {

    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Start the zfs-remote-keyloader service during initrd boot.
	Requires boot.initrd.networking.enable = true
      '';
    };

    package = mkOption {
      type = types.package;
      default = pkgs.zfs-remote-keyloader;
      description = ''
        zfs-remote-keyloader package
      '';
    };

    zfsDataset = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
       The zfs dataset to load keys for.
      '';
    };

    listenAddr = mkOption {
      type = types.str;
      default = ":3333";
      description = ''
        Address the HTTP service should listen on.
      '';
    };

  };

  config = mkIf (config.boot.initrd.network.enable && cfg.enable) {
    assertions = [
      { assertion = config.boot.initrd.network.enable != false;
        message = "boot.initrd.network.enable required for zfs-remote-keyloader";
      }
      { assertion = cfg.zfsDataset != null;
        message = "You must specify a ZFS dataset to load keys for";
      }
    ];

    boot.initrd.extraUtilsCommands = ''
      copy_bin_and_libs ${cfg.package}/bin/zfs-remote-keyloader
    '';

    boot.initrd.extraUtilsCommandsTest = ''
      $out/bin/zfs-remote-keyloader --help >/dev/null 2>&1
    '';

    boot.initrd.postDeviceCommands = ''
      # run the keyloader in the background and if it succeeds, kill any other zfs prompts
      (
        zfs-remote-keyloader server --dataset ${cfg.zfsDataset} --listen ${cfg.listenAddr} && \
        killall zfs
      ) &
    '';

  };

}
