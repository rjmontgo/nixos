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


  home.file = {
    "dmenurecord" = {
      source = ./scripts/dmenurecord;
      target = ".local/bin/dmenurecord";
      executable = true;
    };
  };
}
