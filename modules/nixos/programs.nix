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

    vivid = {
      enable = true;
      theme = "catppuccin-mocha";
    };

    zsh.enable = true;
  };
}
