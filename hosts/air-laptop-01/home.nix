{
  config,
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
      sshAuthSock = "/Users/msviridov/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock";
      rebuildCommand = "darwin-rebuild switch --flake .#air-laptop-01";
      upgradeCommand = "nix flake update && darwin-rebuild switch --flake .#air-laptop-01";
      cleanCommand = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
      homeRebuildCommand = "home-manager switch --flake .#msviridov@air-laptop-01";
    };
  };

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
