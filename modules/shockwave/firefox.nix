{ lib, config, ... }: {

  options.modules.firefox.enable =
    lib.mkEnableOption "Firefox browser";

  config = lib.mkIf config.modules.firefox.enable {
    programs.firefox.enable = true;
  };
}
