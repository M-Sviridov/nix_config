{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"

      set -g allow-passthrough on

      set -g status-left-length 100
      set -g status-left ""
      set -ga status-left "#{?client_prefix,#{#[bg=#{@thm_red},fg=#{@thm_bg},bold]  #S },#{#[bg=#{@thm_bg},fg=#{@thm_green}]  #S }}"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_maroon}]  #{pane_current_command} "
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_blue}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]#{?window_zoomed_flag,│,}"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_yellow}]#{?window_zoomed_flag,  zoom ,}"

      set -g status-right-length 100
      set -g status-right ""
      set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}, none]"

      set -g status-position top
      set -g status-style "bg=#{@thm_bg}"
      set -g status-justify "absolute-centre"

      setw -g pane-border-status top
      setw -g pane-border-format ""
      setw -g pane-active-border-style "bg=#{@thm_bg},fg=#{@thm_overlay_0}"
      setw -g pane-border-style "bg=#{@thm_bg},fg=#{@thm_surface_0}"
      setw -g pane-border-lines single

      set -wg automatic-rename on
      set -g automatic-rename-format "Window"

      set -g window-status-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      set -g window-status-style "bg=#{@thm_bg},fg=#{@thm_rosewater}"
      set -g window-status-last-style "bg=#{@thm_bg},fg=#{@thm_peach}"
      set -g window-status-activity-style "bg=#{@thm_red},fg=#{@thm_bg}"
      set -g window-status-bell-style "bg=#{@thm_red},fg=#{@thm_bg},bold"
      set -gF window-status-separator "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}]│"

      set -g window-status-current-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      set -g window-status-current-style "bg=#{@thm_peach},fg=#{@thm_bg},bold"

      set -g @continuum-restore 'on'
      set -g @resurrect-processes 'ssh'
      set -g @resurrect-strategy-nvim 'session'

      unbind %
      bind | split-window -h
      unbind '"'
      bind - split-window -v
    '';
    clock24 = true;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      continuum
      fzf-tmux-url
      resurrect
      sensible
      tmux-thumbs
      vim-tmux-navigator
      yank
    ];
    sensibleOnTop = true;
  };
}
