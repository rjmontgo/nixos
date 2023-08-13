{ pkgs, ... }:

{
  home.packages = with pkgs; [
    _1password
    _1password-gui
    alacritty
    dmenu
    dunst
    emacs
    ffmpeg-full
    feh
    gcc
    gimp
    google-chrome
    htop
    luakit
    libnotify
    mpv
    neofetch
    newsboat
    ripgrep
    slack
    slop
    sxiv
    tmux
    unzip
    zathura
    zip

    # nvim language servers 
    omnisharp-roslyn # lol, c# gross
    nodePackages.svelte-language-server
    nodePackages.typescript-language-server
    nodePackages.prettier_d_slim
    nodePackages.prettier
    lua-language-server
  ];
}
