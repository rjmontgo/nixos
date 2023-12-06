#
# BlueCrew config
#
{ pkgs, inputs, specialArgs ... }:
let
  username = specialArgs.username
in {
  users.users."${username}" = {
    name = "${username}";
    home = "/Users/${username}";
  };
}
