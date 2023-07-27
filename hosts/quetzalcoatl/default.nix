/**
 *
 * quetzalcoatl -- desktop
 *
 */
{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core-desktop.nix
  ];

  networking.hostName = "quetzalcoatl";

}
