{ pkgs, specialArgs, ... }: {
  home = {
    username = specialArgs.username;
    homeDirectory = "/Users/${specialArgs.username}";
    stateVersion = "23.11";
  };

  # config files
  
  xdg = {
    enable = true;
    configFile = {
      "karabiner/karabiner.json" = {
        source = ./config/karabiner.json;
      };
    };
  };
  
  home.packages = with pkgs; [
    awscli2
  ];

  programs.home-manager.enable = true;
}
