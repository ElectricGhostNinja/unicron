{ pkgs, lib, config, ... }: {

  options.modules.shellTools.enable =
    lib.mkEnableOption "CLI toolkit (neovim, ripgrep, eza, yazi, etc.)";

  config = lib.mkIf config.modules.shellTools.enable {
    environment.systemPackages = with pkgs; [
      neovim
      wget
      git
      emacs
      brave
      fzf
      yazi
      ripgrep
      fd
      fastfetch
      ghostty
      flatpak
      eza
      bat
    ];
  };
}
