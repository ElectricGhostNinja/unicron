{ config, pkgs, ... }:

{
  home.username = "galvatron";
  home.homeDirectory = "/home/galvatron";

  # Match the NixOS release this was first set up against — bump deliberately,
  # same rule as system.stateVersion.
  home.stateVersion = "26.05";

  modules.hm = {
    shell.enable = true;
    git = {
      enable = true;
      userName = "galvatron";
      userEmail = "electricghostninja@gmail.com";
      signingKey = "19BA6CECFA91386E";
    };
    neovim.enable = true;
    ghostty = {
      enable = true;
      theme = "Gruvbox Dark Hard";        # `ghostty +list-themes` for the full list
      fontFamily = "IntoneMono Nerd Font";
      fontSize = 14;
      windowWidth = 120;
      windowHeight = 35;
    };
    starship.enable = true;
    gpg.enable = true;
    doomEmacs.enable = true;  # <--- Enable DoomEmacs
  };

  programs.home-manager.enable = true;
}
