{ lib, config, ... }: {

  options.modules.desktop.plasma.enable =
    lib.mkEnableOption "KDE Plasma 6 desktop environment";

  config = lib.mkIf config.modules.desktop.plasma.enable {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
