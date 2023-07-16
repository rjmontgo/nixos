{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # window manager
    dwm
    dwmblocks
    dunst
    libnotify

    # shell
    st
    ripgrep

    # apps
    zathura
    htop


    #utils
    zip
    unzip


  ];
}
