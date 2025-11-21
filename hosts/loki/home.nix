{
  inputs,
  outputs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.catppuccin
    outputs.homeManagerModules.delta
    outputs.homeManagerModules.gammastep
    outputs.homeManagerModules.git
    outputs.homeManagerModules.gtk
    outputs.homeManagerModules.hyprland
    outputs.homeManagerModules.nixvim
    outputs.homeManagerModules.packages
    outputs.homeManagerModules.programs
    outputs.homeManagerModules.services
    outputs.homeManagerModules.shell
    outputs.homeManagerModules.ssh
    outputs.homeManagerModules.tmux
    outputs.homeManagerModules.waybar
    outputs.homeManagerModules.wezterm
    outputs.homeManagerModules.xdg
    outputs.homeManagerModules.zen-browser

    inputs.catppuccin.homeModules.catppuccin
    inputs.nixvim.homeModules.nixvim
    inputs.vicinae.homeManagerModules.default
    inputs.zen-browser.homeModules.twilight-official
  ];

  # Custom written module
  packages = {
    common.enable = true;
    gui.enable = true;
    utils.enable = true;
  };

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "beekeeper-studio-5.3.4"
        "electron-36.9.5"
        "qtwebengine-5.15.19"
        "ventoy-1.1.07"
      ];
    };
  };

  home = {
    username = "msviridov";
    homeDirectory = "/home/msviridov";
    stateVersion = "24.11";
    shell.enableZshIntegration = true;
  };

  news.display = "silent";

  programs.home-manager.enable = true;
}
