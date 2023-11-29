{ pkgs, inputs, ... }: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    skhd
    yabai
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  ## services config
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    extraConfig = ''
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
      sudo yabai --load-sa

      yabai -m config layout bsp
      yabai -m config top_padding 8
      yabai -m config bottom_padding 16
      yabai -m config left_padding 8
      yabai -m config right_padding 8
      yabai -m config window_gap 4

      yabai -m config window_shadow float
      yabai -m config window_opacity on
      yabai -m config active_window_opacity 1.0
      yabai -m config normal_window_opacity 0.9
      yabai -m config external_bar all:0:30
    '';
  };

  services.skhd = {
    enable = true;
    skhdConfig = ''
      cmd - 0x12 : yabai -m space --focus 1
      cmd - 0x13 : yabai -m space --focus 2
      cmd - 0x14 : yabai -m space --focus 3
      cmd - 0x15 : yabai -m space --focus 4
      cmd - 0x17 : yabai -m space --focus 5
      cmd - 0x16 : yabai -m space --focus 6
      cmd - 0x1A : yabai -m space --focus 7
      cmd - 0x1C : yabai -m space --focus 8
      cmd - 0x19 : yabai -m space --focus 9
      cmd - 0x1D : yabai -m space --focus 10


      cmd + shift - 0x12 : yabai -m window --space 1
      cmd + shift - 0x13 : yabai -m window --space 2
      cmd + shift - 0x14 : yabai -m window --space 3
      cmd + shift - 0x15 : yabai -m window --space 4
      cmd + shift - 0x17 : yabai -m window --space 5
      cmd + shift - 0x16 : yabai -m window --space 6
      cmd + shift - 0x1A : yabai -m window --space 7
      cmd + shift - 0x1C : yabai -m window --space 8
      cmd + shift - 0x19 : yabai -m window --space 9
      cmd + shift - 0x1D : yabai -m window --space 10
      cmd + shift - f : yabai -m window --toggle zoom-fullscreen

      cmd - j : yabai -m window --focus next
      cmd - k : yabai -m window --focus prev 

      cmd - h : yabai -m window --resize right:40:0 ; yabai -m window --resize left:40:0
      cmd - l : yabai -m window --resize left:-40:0 ; yabai -m window --resize right:-40:0

      cmd + alt + ctrl - r : yabai --restart-service
      cmd + alt + ctrl - s : skhd --reload
    '';
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

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
}
