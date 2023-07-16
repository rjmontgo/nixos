{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (oldAttrs: {
        src = fetchGit {
          url = "https://github.com/rjmontgo/dwm.git";
          rev = "c5747a6b712d9bd3dd2e0bcc6b590570dd045205";
        };
      });
      dwmblocks = super.dwmblocks.overrideAttrs (oldAttrs: {
        src = fetchGit {
          url = "https://github.com/rjmontgo/dwmblocks.git";
          rev = "30fe169632977572136365f1c36caaa416031a4c";
        };
      });
    })
  ];
}
