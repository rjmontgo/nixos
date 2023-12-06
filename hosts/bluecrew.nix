#
# BlueCrew config
#
{ pkgs, inputs, specialArgs, ... }:
let
  username = specialArgs.username;
in {
  nixpkgs.hostPlatform = "aarch64-darwin";
  users.users."${username}" = {
    name = "${username}";
    home = "/Users/${username}";
  };

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
}
