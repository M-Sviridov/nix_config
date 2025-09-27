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

    man = {
      enable = true;
      generateCaches = true;
    };

    obsidian = {
      enable = true;
    };

    ripgrep.enable = true;
  };

  xdg = {
    enable = true;

    desktopEntries = {
      bitwarden = {
        categories = ["Utility"];
        comment = "Secure and free password manager for all of your devices";
        exec = "bitwarden --ozone-platform-hint=auto %U";
        icon = "bitwarden";
        genericName = "Password Manager";
        mimeType = ["x-scheme-handler/bitwarden"];
        name = "Bitwarden";
        type = "Application";
      };

      obsidian = {
        categories = ["Office"];
        comment = "Knowledge base";
        exec = "obsidian --ozone-platform-hint=auto %u";
        icon = "obsidian";
        mimeType = ["x-scheme-handler/obsidian"];
        name = "Obsidian";
        type = "Application";
      };
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      publicShare = null;
      templates = null;
    };
  };
}
