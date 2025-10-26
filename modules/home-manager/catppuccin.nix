{...}: {
  catppuccin = {
    enable = true;
    fzf.enable = false;
    # gtk.enable = true;
    gtk.icon.enable = true;
    hyprlock.useDefaultConfig = false;
    waybar = {
      enable = true;
      mode = "prependImport";
    };
    wezterm.enable = false;
    zathura.flavor = "latte";
  };
}
