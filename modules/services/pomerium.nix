{ config, lib, pkgs, ... }:

let

  inherit (lib) types mkEnableOption mkOption mkIf;

  cfg = config.services.pomerium;

  configYml = pkgs.writeText "pomerium-config.yml" (builtins.toJSON cfg.configuration);

in
{

  options.services.pomerium = {
    enable = mkEnableOption "the pomerium service";

    configuration = mkOption {
      type = types.attrsOf types.unspecified;
      description = ''
        pomerium configuration
        (<link xlink:href="https://www.pomerium.io/configuration/">documentation</link>)
        as a Nix attribute set.
      '';
    };

  };

  config = mkIf cfg.enable {

    systemd.services.pomerium = {
      description = "Pomerium access proxy";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      serviceConfig = {
        ExecStart = "${pkgs.pomerium}/bin/pomerium -config ${configYml}";
        Restart = "always";
      };
    };

  };

}
