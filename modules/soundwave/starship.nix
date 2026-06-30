{ lib, config, ... }: {

  options.modules.hm.starship.enable =
    lib.mkEnableOption "starship prompt";

  config = lib.mkIf config.modules.hm.starship.enable {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
