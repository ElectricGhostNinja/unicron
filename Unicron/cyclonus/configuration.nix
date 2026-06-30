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
      hostName = "cyclonus";
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
    laptop.enable = true; # ThinkPad X1 Carbon Gen 6 - touchpad + TLP power mgmt
  };

  system.stateVersion = "26.05";
}
