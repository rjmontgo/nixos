{ config, pkgs, dwm, ... }:
{
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };
  
  environment.sessionVariables = rec {
    XINITRC = "$HOME/.config/X11/xinitrc";
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  boot.loader.systemd-boot.configurationLimit = 10;
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };

  sound.enable = true;
  hardware = {
    pulseaudio.enable = true;
    bluetooth.enable = true;
  };

  virtualisation.docker.enable = true;

  services = {
    printing.enable = true;
    openssh.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "dvorak";

      windowManager.i3.enable = true;
      displayManager.startx.enable = true;
    };
  };

  users.users.rob = {
    isNormalUser = true;
    description = "rob";
    extraGroups = [ "wheel" "video" "docker" ];
    shell = pkgs.zsh;
  };

  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override { 
        fonts = [ "FiraCode" ]; 
      })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Comic Code" "Fira Code Nerd Font"];
      };
    };
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    curl
    autorandr
    xorg.xkbcomp
    gnumake
    stow
  ];

  system.stateVersion = "23.05";
}
