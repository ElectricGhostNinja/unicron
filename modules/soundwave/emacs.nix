
{ lib, config, pkgs, inputs, ... }: {

  imports = [ inputs.nix-doom-emacs-unstraightened.hmModule ];

  options.modules.hm.doomEmacs.enable = 
    lib.mkEnableOption "Doom Emacs (declarative via nix-doom-emacs-unstraightened)";

  config = lib.mkIf config.modules.hm.doomEmacs.enable {
     programs.doom-emacs = {
       enable = true;
       doomDir = ../../users/galvatron/doom.d; # init.el / config.el / packages.el live here
       emacs = pkgs.emacs30-pgtk;
     };
  };

}
