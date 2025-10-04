{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    disableConfirmationPrompt = true;
    escapeTime = 0;
    historyLimit = 10000;
    mouse = true;
    sensibleOnTop = true;
    shortcut = "s";
    terminal = "tmux-256color";

    extraConfig = ''
      set -sg terminal-overrides ",*:RGB"
      set -g default-command "$SHELL"
      set -g repeat-time 1000

      set -g pane-border-lines simple
      set -g pane-border-style fg=black,bright
      set -g pane-active-border-style fg=magenta

      set -g status-position top
      set -g status-style bg=default,fg=black,bright
      set -g status-left ""
      set -g status-right "#[fg=black,bright]#S"

      set -g window-status-format "●"
      set -g window-status-current-format "●"
      set -g window-status-current-style "#{?client_prefix,fg=red,#{?window_zoomed_flag,fg=yellow,fg=magenta},nobold}"
      set -g window-status-bell-style "fg=red,nobold"

      unbind %
      bind | split-window -h
      unbind '"'
      bind - split-window -v

      bind m resize-pane -Z
    '';

    plugins = with pkgs.tmuxPlugins; [
      continuum
      # fzf-tmux-url
      resurrect
      # tmux-thumbs
      vim-tmux-navigator
      # yank
    ];
  };
}
