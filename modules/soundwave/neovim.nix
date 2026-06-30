{ lib, config, pkgs, ... }: {

  options.modules.hm.neovim.enable =
    lib.mkEnableOption "neovim with sane defaults";

  config = lib.mkIf config.modules.hm.neovim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    home.sessionVariables.EDITOR = "nvim";
  };
}
