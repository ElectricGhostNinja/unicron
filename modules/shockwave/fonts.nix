{ pkgs, lib, config, ... }: {

  options.modules.fonts.enable =
    lib.mkEnableOption "system fonts (incl. Nerd Fonts for terminal icons/glyphs)";

  config = lib.mkIf config.modules.fonts.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.monoid
      nerd-fonts.intone-mono
      nerd-fonts.comic-shanns-mono
      noto-fonts
      noto-fonts-color-emoji
    ];

    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "IntoneMono Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
