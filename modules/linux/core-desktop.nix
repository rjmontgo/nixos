{ config, pkgs, specialArgs, nixpkgs, lib, ...}:
let
  username = specialArgs.username;
  hostName = specialArgs.hostname;
in
{
  imports = [
    ./kmonad.nix
    ./tmux.nix
  ];
  
  # sys config
  system.stateVersion = "23.05";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = hostName;
  networking.networkmanager.enable = true;
  hardware.pulseaudio.enable = true;
  sound.enable = true;
  hardware.bluetooth.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  # nix config
  #nixpkgs.config = {
  #  allowUnfree = true;
  #  permittedInsecurePackages = [
  #    "electron-20.9.0"
  #  ];
  #};
  nixpkgs.config.permittedInsecurePackages =
    lib.optional (pkgs.obsidian.version == "1.5.3") "electron-25.9.0";
  nixpkgs.config.allowUnfree = true;
  
  nix = {
    gc = {
      automatic = true;
      persistent = true;

      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "rob"
      ];
      substituters = [
        "https://cache.nixos.org/"
        "s3://arbiter-nix-cache" # personal cache for legacy versions of node
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "arbiter-nix-cache:5aK1jUVIF4kbeK3R+XM091HNJqcoIzUUwcf6RxfbpYk="
      ];
    };
  };

  # TTY
  console = {
    font = "Lat2-Terminus16";
  };

  fonts.packages = with pkgs; [
    fira-code-nerdfont
    inconsolata-nerdfont
    iosevka-comfy.comfy
  ];
  
  users.groups = {
    uinput = {}; 
  };

  # users
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "networkmanager"
      "input" # for kmonad
      "uinput" # for kmonad
      "docker"
    ];
    
    initialPassword = "pw123"; # for first boot only
  };

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    libinput.touchpad = {
      tapping = false;
      disableWhileTyping = true;
    };
  };

  services.blueman.enable = true;
  services.picom.enable = true;

  # docker
  virtualisation.docker.enable = true;

  environment.shellInit = ''
        export XDG_CACHE_HOME="$HOME/.cache"
        export XDG_SCRIPTS_HOME="$HOME/.local/bin"
        export PATH="$PATH:$XDG_SCRIPTS_HOME"
    '';

  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
    settings = {
      allow-emacs-pinentry = "";
    };
  };

  services.gnome.gnome-keyring.enable = true;
  
  environment.systemPackages = with pkgs; [
    
    # development
    alacritty
    bashmount
    docker
    docker-compose
    emacs
    firefox
    git
    slack
    neovim
    wget
    luajitPackages.fennel
    nodePackages_latest.typescript-language-server
    ripgrep
    gcc
    cmake
    gnumake
    libtool
    unzip
    mysql
    passage
    age
    pinentry-curses
    pass
    autorandr
    maim
    xdotool
    xclip
    sbcl
    lispPackages.quicklisp
    firefox
    zathura
    tmux
    fzf
    pulsemixer
    direnv
    discord
    offlineimap
    notmuch
    obsidian
    nodejs_21

    lua-language-server

    nodePackages.typescript

    google-chrome
    _1password-gui
    
    # non-top level
    haskellPackages.kmonad
    leiningen
    

    go
    gopls

  ];
}
