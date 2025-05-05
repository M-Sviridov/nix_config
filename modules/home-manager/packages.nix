{pkgs, ...}: {
  programs = {
    btop = {
      enable = true;
      settings.vim_keys = true;
    };

    fd.enable = true;

    man = {
      enable = true;
      generateCaches = true;
    };

    ripgrep.enable = true;
  };

  # gtk = {
  #   enable = true;
  #
  #   cursorTheme = {
  #     name = "BreezeX-RosePine-Linux";
  #     package = pkgs.rose-pine-cursor;
  #     size = 24;
  #   };
  #
  # };

  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      publicShare = null;
      templates = null;
    };
  };
}
