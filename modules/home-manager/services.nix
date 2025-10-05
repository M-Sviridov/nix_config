{pkgs, ...}: {
  services = {
    # caffeine.enable = true;
    easyeffects.enable = true;
    gnome-keyring.enable = true;
    gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-gnome3;
    };

    udiskie = {
      enable = true;
      tray = "never";
    };

    vicinae = {
      enable = false;
      autoStart = true;
      settings = {
        faviconService = "twenty";
        font.size = 11;
        theme.name = "catppuccin-mocha";
        popToRootOnClose = false;
        rootSearch.searchFiles = false;

        window = {
          csd = true;
          opacity = 0.95;
          rounding = 10;
        };
      };
    };
  };
}
