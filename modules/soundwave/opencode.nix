{ lib, config, pkgs, ... }:

let
  cfg = config.modules.hm.opencode;
in {

  options.modules.hm.opencode = {
    enable = lib.mkEnableOption "opencode";

    nodejsPackage = lib.mkOption {
      type = lib.types.package;
      default = pkgs.nodejs_22;
      description = ''
        Node.js package to install alongside opencode. Many opencode
        plugins / MCP servers shell out to npx, so Node is installed
        as a sibling package rather than a build dependency.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.opencode
      cfg.nodejsPackage
    ];
  };
}
