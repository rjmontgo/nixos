/**
 *
 * nixd - laptop
 *
 */
{ config, pkgs, ... }: 

{
  imports = [
    ./hardware-configuration.nix
    ./autorandr.nix

    # modules
    ../../modules/nixos/core-desktop.nix
  ];
  networking.hostName = "nixd";
}
