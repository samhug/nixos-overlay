{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.coredns;
  coredns = pkgs.coredns;

  corednsConf = pkgs.writeText "Corefile" cfg.config;
in

{

  ###### interface

  options = {

    services.coredns = {

      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to run CoreDNS.
        '';
      };

      resolveLocalQueries = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Whether CoreDNS should resolve local queries (i.e. add 127.0.0.1 to
          /etc/resolv.conf).
        '';
      };

      config = mkOption {
        type = types.lines;
        default = "";
        description = ''
          contents of Corefile
        '';
      };

    };

  };


  ###### implementation

  config = mkIf config.services.coredns.enable {

    networking.nameservers =
      optional cfg.resolveLocalQueries "127.0.0.1";

    systemd.services.coredns = {
        description = "CoreDNS DNS Server";
        documentation = [ "https://coredns.io" ];
        after = [ "network.target" "systemd-resolved.service" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          PermissionsStartOnly = true;
          LimitNOFILE = 1048576;
          LimitNPROC = 512;
          CapabilityBoundingSet = "CAP_NET_BIND_SERVICE";
          AmbientCapabilities = "CAP_NET_BIND_SERVICE";
          NoNewPrivileges = true;
          DynamicUser = true;
          ExecStart = "${coredns}/bin/coredns -conf=${corednsConf}";
          ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR1 $MAINPID";
          Restart = "on-failure";
        };
        restartTriggers = [ config.environment.etc.hosts.source ];
    };
  };
}
