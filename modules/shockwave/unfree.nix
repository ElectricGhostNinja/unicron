{ lib, config, ... }: {

  options.modules.unfree.enable =
    lib.mkEnableOption "allow unfree packages";

  config = lib.mkIf config.modules.unfree.enable {
    nixpkgs.config.allowUnfree = true;
  };
}
