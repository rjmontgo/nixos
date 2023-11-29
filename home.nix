{ pkgs, ... }: {
  home = {
    username = "rob";
    homeDirectory = "/Users/rob";
    stateVersion = "23.11";
  };

  home.packages = with pkgs; [
    docker

    jdk21
    leiningen
    maven
  ];

  programs.home-manager.enable = true;
}
