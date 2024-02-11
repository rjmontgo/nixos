{ config, lib, pkgs, stdenv, ... }:

let
  my-pkg = pkgs.stdenv.mkDerivation rec {
    name = "udev-bluetooth-xm3-${version}";
    version = "1.0";
    src = ./udev;
    nativeBuildInputs = [];
    buildInputs = with pkgs; [
      sudo
      pulseaudio
      bash
    ];
    buildPhase = "";
    installPhase = ''
      mkdir -p $out/bin $out/etc/udev/rules.d

      echo "#!/bin/sh
logger \"test this thing\"

sleep 2

${pkgs.sudo}/bin/sudo -u '#1000' XDG_RUNTIME_DIR=/run/user/1000 ${pkgs.pulseaudio}/bin/pactl set-card-profile bluez_card.CC_98_8B_D2_0D_71 handsfree_head_unit

logger \"test log to syslog\"" >> $out/bin/bt-headphones-switch
      
      chmod 755 $out/bin/bt-headphones-switch

      echo "ACTION==\"add\", SUBSYSTEM==\"input\", ATTR{id/vendor}==\"054c\", ATTR{id/product}==\"0cd3\", RUN+=\"${pkgs.bash}/bin/bash -c '$out/bin/bt-headphones-switch > /tmp/on-connect.log 2>&1'\"" >> $out/etc/udev/rules.d/52-bluetooth-headphones-switch.rules
    '';
  };
  # my-pkg = pkgs.writeScript "headphones" ''
  #   #!/bin/sh
  #   logger "test this thing"

  #   sleep 8

  #   ${pkgs.sudo}/bin/sudo -u '#1000' XDG_RUNTIME_DIR=/run/user/1000 ${pkgs.pulseaudio}/bin/pactl set-card-profile bluez_card.CC_98_8B_D2_0D_71 handsfree_head_unit
  #   logger "test log to syslog"
  # '';      
  my-rules = pkgs.writeTextFile {
    name = "52-sony-bluetooth-auto-headset.rules";
    text = ''
      ACTION=="add", SUBSYSTEM=="input", ATTR{id/vendor}=="054c", ATTR{id/product}=="0cd3", RUN+="${pkgs.bash}/bin/bash -c '${my-pkg} > /tmp/on-connect.log 2>&1'"
    '';
    destination = "/etc/udev/rules.d/52-sony-bluetooth-auto-headset.rules";
  };
in {
  # services.udev.extraRules = ''
  #   ACTION=="add", SUBSYSTEM=="input", ATTR{id/vendor}=="054c", ATTR{id/product}=="0cd3", RUN+="${pkgs.bash}/bin/bash -c '${my-pkg} > /tmp/on-connect.log 2>&1'"
  # '';
  services.udev.packages = [
    my-pkg
  ];
}
