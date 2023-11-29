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

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
      ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;

      ## services config
      services.yabai = {
        enable = true;
        enableScriptingAddition = true;
      };

      services.skhd = {
        enable = true;
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      homebrew = {
        enable = true;

        brews = [
          "openssl"
        ];

        casks = [
          # apps
          "1password"
          "emacs"
          "google-chrome"
          "karabiner-elements"
          "microsoft-teams"
          "slack"
          "ubersicht"

          # other
          "font-fira-code-nerd-font"
        ];
      };

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      nixpkgs.config.allowUnfree = true;

      users.users."rob" = {
        name = "rob";
        home = "/Users/rob";
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mactop
    darwinConfigurations."mactop" = nix-darwin.lib.darwinSystem {
      modules = [
        ./darwin.nix
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users."rob" = import ./home.nix;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."simple".pkgs;
  };
}
