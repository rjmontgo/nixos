{ modulesPath, ... }: {
  imports = [ "${modulesPath}/virtualisation/amazon-image.nix" ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
