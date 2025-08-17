{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    hyprcursor
    hyprpicker
    hyprshot
    rose-pine-hyprcursor
    waypaper
    wl-clipboard
  ];

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  services = {
    clipse = {
      enable = true;
      historySize = 1000;
      # theme = {};
    };

    hyprpolkitagent.enable = true;
    playerctld.enable = true;
    swww.enable = true;
    udiskie.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    plugins = [
      inputs.hyprsplit.packages."${pkgs.stdenv.hostPlatform.system}".hyprsplit
      inputs.hyprgrass.packages.${pkgs.system}.default
    ];
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    systemd.enable = false;
    xwayland.enable = true;
  };
}
