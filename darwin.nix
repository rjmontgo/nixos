{ pkgs, ... }: {
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
