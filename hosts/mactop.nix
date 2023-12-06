#
# Personal Macbook config
#
{ pkgs, inputs, ... }: {
  users.users."rob" = {
    name = "rob";
    home = "/Users/rob";
  };
}
