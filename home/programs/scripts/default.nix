{ pkgs, ... }:

{
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  xdg.dataFile = {
    "syncdevices" = {
      source = ./scripts/syncdevice.sh;
      target = ./bin/syncdevices;
    };
  };
}
