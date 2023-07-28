{ pkgs, ... }:

{
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.file = {
    "syncdevices" = {
      source = ./scripts/syncdevice;
      target = "$HOME/.local/bin/syncdevices";
      executable = true;
    };
  };
}
