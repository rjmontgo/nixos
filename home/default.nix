{ config, pkgs, ... }:


{
  imports = [
    ./bin
    ./config
    ./programs
  ];

  home = {
    username = "rob";
    homeDirectory = "/home/rob";
    stateVersion = "23.05";
  };

  # home manager manages itself
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    syntaxHighlighting = {
       enable = true;
    };
    shellAliases = {
      tmux = "TERM=xterm-256color tmux";
    };
    initExtra = ''
      autoload -U colors && colors
      export PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
    '';

  };

  services.ssh-agent.enable = true;
}
