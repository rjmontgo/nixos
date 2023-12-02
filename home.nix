{ pkgs, ... }: {
  home = {
    username = "rob";
    homeDirectory = "/Users/rob";
    stateVersion = "23.11";
  };

  home.packages = with pkgs; [
    notmuch
    offlineimap
    mailctl

    ## prog
    docker

    # typescript
    nodePackages.typescript-language-server
    nodePackages.typescript
    nodejs_21

    # java
    jdk21
    leiningen
    clojure-lsp
    maven


  ];

  programs.home-manager.enable = true;
}
