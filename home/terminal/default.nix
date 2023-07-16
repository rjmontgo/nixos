{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
     (self: super: {
      st = super.st.overrideAttrs (oldAttrs: {
        src = fetchGit {
          url = "https://github.com/rjmontgo/st.git";
          rev = "a56f3edf25d6838b67f32a979b9d0672ab1e3c16";
        };
      });
    })
  ];
}
