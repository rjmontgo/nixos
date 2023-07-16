# only for testing on ec2 instances for now
{ config, pkgs, modulesPath, ... }:

{
  imports = [
    ../../modules/system.nix

    # hardware config for aws
    "${modulesPath}/virtualisation/amazon-image.nix"
  ];

  services.xrdp = {
    enable = true;
    openFirewall = true;
    defaultWindowManager = "dwm";
  };
}
