{ config, pkgs, ... }:

{
    services.udev.extraRules =
    ''
      # KMonad user access to /dev/uinput
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';

    systemd.services."kmonad" = {
      enable = true;
      description = "Background Kmonad process for laptop keyboard";
      serviceConfig = {
        Type = "simple";
        ExecStart = "/run/current-system/sw/bin/kmonad /home/rob/.config/kmonad/config.kbd";
      };

      wantedBy = ["default.target"];
    };
}
