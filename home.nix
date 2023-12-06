{ pkgs, specialArgs, ... }: {
  home = {
    username = specialArgs.username;
    homeDirectory = "/Users/${specialArgs.username}";
    stateVersion = "23.11";
  };

  # config files
  
  xdg = {
    enable = true;
    configFile = {
      "karabiner/karabiner.json" = {
        source = ./config/karabiner.json;
      };
    };
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
