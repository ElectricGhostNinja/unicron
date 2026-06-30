# PLACEHOLDER — replace this file with the real one generated on the laptop.
#
# On the ThinkPad X1 Carbon Gen 6, after booting the NixOS installer (or
# from an existing install), run:
#
#   sudo nixos-generate-config --show-hardware-config > Unicron/cyclonus/hardware-configuration.nix
#
# This file MUST be replaced before `nixos-rebuild` will work for cyclonus —
# the UUIDs below do not exist and are only here so the flake evaluates.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "thinkpad_acpi" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/REPLACE-ME-ROOT-UUID";
      fsType = "btrfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/REPLACE-ME-BOOT-UUID";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
