{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    awscli2
    mysql-workbench
    teams-for-linux
  ];

  services.resolved.enable = true;
  programs.openvpn3.enable = true;
}
