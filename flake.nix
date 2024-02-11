{
  description = "My Nixos Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ...}@inputs: {
    nixpkgs.overlays = [
      import ./overlays/dwm.nix
    ];
    
    nixosConfigurations.arbiter = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs // {
        hostname = "arbiter";
        username = "rob";
      };
      modules = [
	      ./hosts/arbiter
  	    ./modules/linux/core-desktop.nix
        ./modules/work/bluecrew.nix

	      home-manager.nixosModules.home-manager {
	        home-manager.useGlobalPkgs = true;
	        home-manager.useUserPackages = true;
	        home-manager.users.rob = import ./home;
	      }
      ];
    };
    
    nixosConfigurations.quetzal = nixpkgs.lib.nixosSystem {
      
      system = "x86_64-linux";
      specialArgs = inputs // {
        hostname = "quetzal";
        username = "rob";
      };
      modules = [
        ./hosts/quetzal 
        ./modules/linux/core-desktop.nix
        ./modules/work/bluecrew.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.rob = import ./home;
        }
      ];
    };
  };
}
