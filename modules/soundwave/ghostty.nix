{ lib, config, ... }: {

  options.modules.hm.ghostty = {
    enable = lib.mkEnableOption "ghostty terminal config";
    theme = lib.mkOption {
      type = lib.types.str;
      default = "Gruvbox Dark Hard";
      description = "Built-in ghostty theme name. List options with `ghostty +list-themes`.";
    };
    fontFamily = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "Font family, e.g. \"IntoneMono Nerd Font \". Leave null for ghostty's default.";
    };
    fontSize = lib.mkOption {
      type = lib.types.int;
      default = 14;
    };
    windowWidth = lib.mkOption {
      type = lib.types.int;
      default = 120;
      description = "window height in columns.";
    };
    windowHeight = lib.mkOption {
      type = lib.types.int;
      default = 35;
      description = "window height in rows.";
    };
  };

  config = lib.mkIf config.modules.hm.ghostty.enable {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = config.modules.hm.ghostty.theme;
        font-size = config.modules.hm.ghostty.fontSize;
        window-width = config.modules.hm.ghostty.windowWidth;
        window-height = config.modules.hm.ghostty.windowHeight;
      } // lib.optionalAttrs (config.modules.hm.ghostty.fontFamily != null) {
        font-family = config.modules.hm.ghostty.fontFamily;
      };
    };
  };
}
