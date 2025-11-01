{
  config,
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    brightnessctl
    hyprcursor
    hyprpicker
    hyprshot
    rose-pine-hyprcursor
    # waypaper
    wl-clipboard
    xdg-desktop-portal-gtk
  ];

  home.sessionVariables = {
    DISPLAY = ":0";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    HYPRCURSOR_THEME = "rose-pine-hyprcursor";
    HYPRCURSOR_SIZE = 24;
    HYPRSHOT_DIR = "/home/msviridov/Pictures/screenshots";
    XCURSOR_THEME = "BreezeX-RosePine";
    XCURSOR_SIZE = 24;
  };

  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  services = {
    clipse = {
      enable = true;
      historySize = 1000;
      imageDisplay = {
        type = "kitty";
        heightCut = 20;
        scaleX = 60;
        scaleY = 60;
      };

      theme = {
        useCustomTheme = true;
        TitleFore = "#1e1e2e";
        TitleBack = "#cba6f7";
        TitleInfo = "#a6adc8";
        NormalTitle = "#cdd6f4";
        DimmedTitle = "#a6adc8";
        SelectedTitle = "#f38ba8";
        NormalDesc = "#6c7086";
        DimmedDesc = "#45475a";
        SelectedDesc = "#f5e0dc";
        StatusMsg = "#a6e3a1";
        PinIndicatorColor = "#fab387";
        SelectedBorder = "#f38ba8";
        SelectedDescBorder = "#eba0ac";
        FilteredMatch = "#f9e2af";
        FilterPrompt = "#a6e3a1";
        FilterInfo = "#a6adc8";
        FilterText = "#cdd6f4";
        FilterCursor = "#fab387";
        HelpKey = "#f5c2e7";
        HelpDesc = "#a6adc8";
        PageActiveDot = "#cba6f7";
        PageInactiveDot = "#45475a";
        DividerDot = "#6c7086";
        PreviewedText = "#cdd6f4";
        PreviewBorder = "#a6adc8";
      };
    };

    hyprpolkitagent.enable = true;
    playerctld.enable = true;
    # swww.enable = true;
    udiskie.enable = true;
    wpaperd = {
      enable = true;

      settings = {
        eDP-1 = {
          path = "${config.home.homeDirectory}/pictures/catppuccin/";
          apply-shadow = true;
          duration = "30m";
          sorting = "random";
        };
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    plugins = [
      inputs.hyprsplit.packages."${pkgs.stdenv.hostPlatform.system}".hyprsplit
      # inputs.hyprgrass.packages.${pkgs.system}.default
    ];
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    systemd.enable = false;
    xwayland.enable = true;
  };
}
