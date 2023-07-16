{ config, pkgs, ... }:


{
  # setup main applications here that require config
  # dwm, dmwblocks, st
  imports = [
    ./terminal
    ./dwm
    ./programs
  ];

  home = {
    username = "rob";
    homeDirectory = "/home/rob";
    stateVersion = "23.05";
  };

  # home manager manages itself
  programs.home-manager.enable = true;
}
