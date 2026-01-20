{
  config,
  inputs,
  outputs,
  type,
  user,
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
    inputs.nix-index-database.homeModules.default
    inputs.vicinae.homeManagerModules.default
    inputs.zen-browser.homeModules.twilight-official
  ];

  my = {
    packages = {
      common.enable = true;
      gui.enable = true;
      utils.enable = true;
    };

    programs = {
      git = {
        enable = true;
        userName = "M-Sviridov";
        userEmail = "74146348+M-Sviridov@users.noreply.github.com";
        signing.key = "${config.home.homeDirectory}/.ssh/sign_github_ed25519.pub";
      };

      wezterm = {
        enable = true;
        fontSize = 12.0;
        dpi = 96.0;
      };
    };

    shell.zsh = {
      enable = true;
      sshAuthSock = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
    };
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
        "ventoy-1.1.10"
      ];
    };
  };

  home = {
    username = user;
    homeDirectory =
      if type == "darwin"
      then "/Users/${user}"
      else "/home/${user}";
    stateVersion = "24.11";
    shell.enableZshIntegration = true;
  };

  news.display = "silent";

  programs.home-manager.enable = true;
}
