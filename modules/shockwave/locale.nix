{ lib, config, ... }: {

  options.modules.locale = {
    enable = lib.mkEnableOption "locale + timezone settings";
    timeZone = lib.mkOption {
      type = lib.types.str;
      default = "America/Los_Angeles";
      description = "System timezone";
    };
  };

  config = lib.mkIf config.modules.locale.enable {
    time.timeZone = config.modules.locale.timeZone;

    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
}
