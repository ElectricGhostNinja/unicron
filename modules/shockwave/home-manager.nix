{ inputs, ... }: {

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";

    users."galvatron" = {
      imports = [
        ../../users/galvatron/home.nix
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };
}
