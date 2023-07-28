{ pkgs, ... }:

{
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.file = {
    "syncdevices" = {
      source = ./scripts/syncdevices;
      target = ".local/bin/syncdevices";
      executable = true;
    };
  };
}
