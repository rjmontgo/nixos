{ pkgs, ... }:

{
  imports = [
    ./X11
  ];

  xdg.enable = true;
}
