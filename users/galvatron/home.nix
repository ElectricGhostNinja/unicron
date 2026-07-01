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
    doomEmacs.enable = true;
    opencode.enable = true; # <--- Enable DoomEmacs

    mu4e = {
      enable = true;
      accounts = {
        personal = {
          primary = true;
          realName = "Electric Ghost Ninja";
          address = "electricghostninja@gmail.com";
          imapHost = "imap.gmail.com";
          smtpHost = "smtp.gmail.com";
          passwordCommand = "yzfeibwtctoaqqig";
        };

        work = {
          realName = "Dominick Acholonu";
          address = "docholonu@gmail.com";
          imapHost = "imap.gmail.com";
          smtpHost = "smtp.gmail.com";
          passwordCommand = "pulndlccpzcflnne";
        };

        side-project = {
          realName = "Captain Illuminate";
          address = "capt.illuminate@gmail.com";
          imapHost = "imap.gmail.com";
          smtpHost = "smtp.gmail.com";
          passwordCommand = "ellnqxdzqxczngbb";
        };

        old-account = {
          realName = "I dunk on Code";
          address = "idunkoncode@gmail.com";
          imapHost = "imap.gmail.com";
          smtpHost = "smtp.gmail.com";
          passwordCommand = "lihrermkqttkoyhw";
        };
      };
    };
  };

  programs.home-manager.enable = true;
}
