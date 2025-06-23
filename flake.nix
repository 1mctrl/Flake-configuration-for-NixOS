{
  description = "NixOS Supermacy System with Telega and TDLib 1.8.44+";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.supermacy = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/atlas.nix
          ./modules/bspwm.nix
          ./modules/sql.nix
          ./modules/audio.nix
          ./modules/networking.nix
          ./users/atlas.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.atlas = import ./home/atlas.nix;
          }
        ];
      };
    };
}
