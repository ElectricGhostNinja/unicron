{
  description = "Unicron — Decepticon fleet NixOS config (galvatron desktop / cyclonus laptop)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-doom-emacs-unstraightened = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
  in {

    # importable as a unit: inputs.self.outputs.homeManagerModules.default
    homeManagerModules.default = ./modules/soundwave;

    nixosConfigurations = {

      # Desktop
      galvatron = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./Unicron/galvatron/configuration.nix
          ./modules/shockwave
          home-manager.nixosModules.home-manager
        ];
      };

      # Laptop - ThinkPad X1 Carbon Gen 6
      cyclonus = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./Unicron/cyclonus/configuration.nix
          ./modules/shockwave
          home-manager.nixosModules.home-manager
        ];
      };

    };
  };
}
