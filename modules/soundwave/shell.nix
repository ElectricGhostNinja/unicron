{ lib, config, pkgs, ... }: {

  options.modules.hm.shell.enable =
    lib.mkEnableOption "shell aliases for the eza/bat/fd/ripgrep toolkit";

  config = lib.mkIf config.modules.hm.shell.enable {
    programs.bash = {
      enable = true;
      shellAliases = {
        ls = "eza --icons";
        ll = "eza -la --icons";
        cat = "bat";
        find = "fd";
        grep = "rg";

        # your new lines go here, same format: name = "command";
        nrs = "sudo nixos-rebuild switch --flake ~/unicron#galvatron";
      };

      initExtra = ''
        # zoxide-aware cd: jumps via zoxide if it knows the target,
        # otherwise falls back to a real cd. (Aliases can't branch on
        # arguments correctly, so this has to be a function.)
        cd() {
          if [ "$#" -eq 0 ]; then
            builtin cd ~
          else
            z "$@" 2>/dev/null || builtin cd "$@"
          fi
        }
      '';
    };

    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
    };

    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
