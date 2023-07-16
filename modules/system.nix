{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  services.printing.enable = true;

  networking.firewall.enable = false;

  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    curl
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.windowManager.dwm.enable = true;
  services.xserver.displayManager.startx.enable = true;

  users.users.rob = {
    isNormalUser = true;
    description = "rob";
    extraGroups = [ "wheel" "video" ];
  };
}
