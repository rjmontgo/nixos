{
  description = "flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      "quetzalcoatl" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	modules = [
          ./hosts/quetzalcoatl

	  home-manager.nixosModules.home-manager
	  {
            home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;

	    home-manager.users.rob = import ./home;
	  }
	];
      };
      "nixd" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/laptop

          # home manager setup
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.rob = import ./home;
          }
        ];
      };
    };
  };
}
