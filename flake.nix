
{
  description = "NixOS Supermacy System";

  inputs = {
nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  flake-utils.url = "github:numtide/flake-utils";

  home-manager = {
    url = "github:nix-community/home-manager/release-24.11";
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
