{ pkgs, ... }:

{
  xdg.configFile."feh" = {
    source = ./files/fehbg;
    target = "feh/fehbg";
  };
  xdg.configFile."layout" = {
    source = ./files/layout.xkb;
    target = "X11/layout.xkb";
  };

  xdg.configFile."xinitrc" = {
    source = ./files/xinitrc;
    target = "X11/xinitrc";
  };
}
