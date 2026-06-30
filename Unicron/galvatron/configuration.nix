{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  modules = {
    boot.enable = true;
    locale = {
      enable = true;
      timeZone = "America/Los_Angeles";
    };
    networking = {
      enable = true;
      hostName = "galvatron";
    };
    audio.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    desktop.plasma.enable = true;
    shellTools.enable = true;
    firefox.enable = true;
    unfree.enable = true;
    ssh.enable = true;
    fonts.enable = true;
    laptop.enable = false; # desktop - no battery/touchpad management
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data were taken. Leave as-is once set.
  system.stateVersion = "26.05";
}
