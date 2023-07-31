{ pkgs, ... }:

{
  home.packages = with pkgs; [
    _1password
    _1password-gui
    alacritty
    dmenu
    dunst
    ffmpeg-full
    feh
    gcc
    gimp
    google-chrome
    htop
    luakit
    libnotify
    neofetch
    newsboat
    picom
    ripgrep
    unzip
    slack
    slop
    sxiv
    tmux
    zathura
    zip

    # nvim language servers 
    nodePackages.svelte-language-server
    nodePackages.typescript-language-server
    nodePackages.prettier_d_slim
    nodePackages.prettier
    lua-language-server
  ];
}
