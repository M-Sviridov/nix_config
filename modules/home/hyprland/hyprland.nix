{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    clipse
    hyprpicker
    hyprpolkitagent
    swww
    waypaper
    wl-clipboard
    xdg-desktop-portal-gtk
  ];

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [inputs.hyprsplit.packages."${pkgs.stdenv.hostPlatform.system}".hyprsplit];
    xwayland = {
      enable = true;
    };
  };
}
