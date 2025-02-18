{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    hyprpolkitagent
    swww
    wl-clipboard
    xdg-desktop-portal-gtk
  ];
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    # style = "kvantum";
  };
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [inputs.hyprsplit.packages."${pkgs.stdenv.hostPlatform.system}".hyprsplit];
    xwayland = {
      enable = true;
    };
  };
}
