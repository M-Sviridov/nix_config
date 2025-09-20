{
  inputs,
  outputs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.anki
    outputs.homeManagerModules.catppuccin
    # outputs.homeManagerModules.firefox
    outputs.homeManagerModules.gammastep
    outputs.homeManagerModules.git
    outputs.homeManagerModules.gtk
    outputs.homeManagerModules.hyprland
    outputs.homeManagerModules.nvf
    outputs.homeManagerModules.packages
    outputs.homeManagerModules.programs
    outputs.homeManagerModules.services
    outputs.homeManagerModules.shell
    outputs.homeManagerModules.ssh
    outputs.homeManagerModules.tmux
    outputs.homeManagerModules.waybar
    outputs.homeManagerModules.wezterm
    outputs.homeManagerModules.zen-browser

    inputs.catppuccin.homeModules.catppuccin
    inputs.nvf.homeManagerModules.default
    inputs.vicinae.homeManagerModules.default
    inputs.zen-browser.homeModules.twilight
  ];

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "ventoy-1.1.07"
        "qtwebengine-5.15.19"
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
