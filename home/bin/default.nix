{ pkgs, ... }:

{
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.file = {
    "syncdevices" = {
      source = ./scripts/syncdevices;
      target = "$HOME/.local/bin/syncdevices";
      executable = true;
    };
  };
}
