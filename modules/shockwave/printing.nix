{ lib, config, ... }: {

  options.modules.printing.enable =
    lib.mkEnableOption "CUPS printing support";

  config = lib.mkIf config.modules.printing.enable {
    services.printing.enable = true;
  };
}
