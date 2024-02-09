{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      
      set -g base-index 1
      setw -g pane-base-index 1
      set -g mouse on
      set -sg escape-time 0 

      set-option -g history-limit 25000
      set -g status-style "fg=#665c54"
      set -g status-left-style "fg=#928374"

      set -g status-bg default
      set -g status-position top
      set -g status-interval 1
      set -g status-left ""
      set -g status-right ""

      set -g status on

      # set tmux true-color 
      # an actual helpful post on this topic 
      # https://askubuntu.com/questions/125526/vim-in-tmux-display-wrong-colors
      set-option -sa terminal-overrides ",alacritty:Tc"
      set -g default-terminal "tmux-256color"

      bind-key -n M-1 select-window -t 1
      bind-key -n M-2 select-window -t 2
      bind-key -n M-3 select-window -t 3
      bind-key -n M-4 select-window -t 4
      bind-key -n M-5 select-window -t 5
      bind-key -n M-6 select-window -t 6
      bind-key -n M-7 select-window -t 7
      bind-key -n M-8 select-window -t 8
      bind-key -n M-9 select-window -t 9
    '';
  };
}
