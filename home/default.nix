{ config, pkgs, ... }: {
  home = {
    username = "rob";
    homeDirectory = "/home/rob";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;

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
}
