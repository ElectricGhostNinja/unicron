{ pkgs, lib, config, ... }: {

  options.modules.flatpak.enable =
    lib.mkEnableOption "flatpak + xdg-desktop-portal";

  config = lib.mkIf config.modules.flatpak.enable {
    services.flatpak.enable = true;
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
