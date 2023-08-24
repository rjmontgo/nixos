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
    sessionVariables = {
      DIRENV_LOG_FORMAT = "";
    };
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
      e = "emacsclient -c";
    };
    initExtra = ''
      autoload -U colors && colors
      export PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
    '';
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim.defaultEditor = true;

  services.ssh-agent.enable = true;
  # services.picom = {
  #   enable = true;
  #   vSync = true;
  #   opacityRules = [
  #     "50:class_g = 'Emacs' && focused"
  #   ];
  # };
}
