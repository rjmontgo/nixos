{ pkgs, ... }:

{
  home.packages = with pkgs; [
    _1password
    _1password-gui
    alacritty
    dmenu
    dunst
    eww-wayland
    emacs29-gtk3    
    ffmpeg-full
    feh
    gcc
    gimp
    google-chrome
    htop
    hyprpaper
    jq
    luakit
    libnotify
    mpv
    neofetch
    newsboat
    picom
    python311
    ripgrep
    wofi
    sc-im
    slack
    slop
    socat
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
    python311Packages.python-lsp-server
    nixd
  ];
}
