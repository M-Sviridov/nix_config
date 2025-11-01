{
  inputs,
  outputs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.catppuccin
    outputs.homeManagerModules.delta
    outputs.homeManagerModules.git
    outputs.homeManagerModules.nixvim
    outputs.homeManagerModules.packages
    outputs.homeManagerModules.programs
    outputs.homeManagerModules.shell
    outputs.homeManagerModules.ssh
    outputs.homeManagerModules.tmux
    outputs.homeManagerModules.wezterm
    # outputs.homeManagerModules.zen-browser

    inputs.catppuccin.homeModules.catppuccin
    inputs.nixvim.homeModules.nixvim
    inputs.zen-browser.homeModules.twilight-official
  ];

  packages.common.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [inputs.nur.overlays.default];

  home = {
    username = "msviridov";
    homeDirectory = "/Users/msviridov";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
  news.display = "silent";
}
