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
    inputs.nix-index-database.homeModules.default
    inputs.zen-browser.homeModules.twilight-official
  ];

  my = {
    packages.common.enable = true;

    programs = {
      git = {
        enable = true;
        userName = "M-Sviridov";
        userEmail = "74146348+M-Sviridov@users.noreply.github.com";
        signing.key = "${config.home.homeDirectory}/.ssh/sign_github_ed25519.pub";

        extraSettings = {
          pull.rebase = true;
          rerere.enabled = true;
        };
      };

      wezterm = {
        enable = true;
        fontSize = 14.0;
        dpi = 144.0;
        windowDecorations = "RESIZE";
      };
    };

    shell.zsh = {
      enable = true;
      sshAuthSock = "${config.home.homeDirectory}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock";
      cleanCommand = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
    };
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [inputs.nur.overlays.default];

  home = {
    username = user;
    homeDirectory =
      if type == "darwin"
      then "/Users/${user}"
      else "/home/${user}";
    stateVersion = "25.05";
    shell.enableZshIntegration = true;
  };

  programs.home-manager.enable = true;
  news.display = "silent";
}
