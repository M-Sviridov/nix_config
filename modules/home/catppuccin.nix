{...}: {
  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
    gtk = {
      enable = true;
      icon.enable = true;
    };
    tmux.extraConfig = ''
      set -g @catppuccin_flavor "mocha"
      set -g @catppuccin_status_background "none"
      set -g @catppuccin_window_status_style "none"
      set -g @catppuccin_pane_status_enabled "off"
      set -g @catppuccin_pane_border_status "off"
    '';
  };
}
