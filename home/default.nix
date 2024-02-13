{ config, pkgs, ... }: {
  home = {
    username = "rob";
    homeDirectory = "/home/rob";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Robert Montgomery";
    userEmail = "robm4958@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  xdg.configFile."kmonad" = {
    source = ./xdg/kmonad/config.kbd;
    target = "kmonad/config.kbd";
  };

  # bin scripts
  home.file.".local/bin/capture" = {
    source = ./xdg/bin/capture;
  };

  home.file.".local/bin/tmux-sessionizer" = {
    source = ./xdg/bin/tmux-sessionizer;
  };

  home.file.".local/bin/bt-switch-headphones" = {
    source = ./xdg/bin/bt-switch-headphones;
  };
}
