{ pkgs, lib, config, ... }: {

  options.modules.boot.enable =
    lib.mkEnableOption "systemd-boot + latest kernel";

  config = lib.mkIf config.modules.boot.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
