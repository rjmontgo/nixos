{
  description = "Mactop Flake / darwin config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mactop
    darwinConfigurations."mactop" = nix-darwin.lib.darwinSystem {
      modules = [
        ./darwin.nix
        ./hosts/mactop.nix
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users."rob" = import ./home.nix;
          home-manager.extraSpecialArgs = { username = "rob"; };
        }
      ];

      specialArgs = { inherit inputs; };
    };

    # work laptop
    darwinConfigurations."bluecrew" = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/bluecrew.nix
        ./darwin.nix
      ];
      specialArgs = { inherit inputs; username = "rob"; };
    };
  };
}
