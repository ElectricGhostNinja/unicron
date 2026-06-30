{ lib, config, ... }: {

  options.modules.laptop.enable =
    lib.mkEnableOption "laptop extras (touchpad, power management)";

  config = lib.mkIf config.modules.laptop.enable {
    services.libinput.enable = true;

    services.tlp.enable = true;
    services.power-profiles-daemon.enable = false; # tlp and power-profiles-daemon conflict

    powerManagement.enable = true;
  };
}
