{ lib, config, pkgs, ... }: {

  options.modules.hm.gpg.enable =
    lib.mkEnableOption "gpg + gpg-agent (key itself is generated manually, not declaratively)";

  config = lib.mkIf config.modules.hm.gpg.enable {
    programs.gpg.enable = true;

    services.gpg-agent = {
      enable = true;
      enableSshSupport = false;
      pinentry.package = pkgs.pinentry-qt; # matches Plasma 6
      defaultCacheTtl = 3600;
      maxCacheTtl = 86400;
    };
  };
}
