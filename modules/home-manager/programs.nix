{config, ...}: {
  programs = {
    btop = {
      enable = true;
      settings.vim_keys = true;
    };

    fd.enable = true;

    gpg = {
      enable = true;
      homedir = "${config.xdg.configHome}/gnupg";
    };

    lazygit.enable = true;

    man = {
      enable = true;
      generateCaches = true;
    };

    ripgrep.enable = true;
  };
}
