{...}: {
  programs = {
    dconf.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    localsend = {
      enable = true;
      openFirewall = true;
    };

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 2";
      flake = "/home/msviridov/dotfiles-nix";
    };

    vivid = {
      enable = true;
      theme = "catppuccin-mocha";
    };

    zsh.enable = true;
  };
}
