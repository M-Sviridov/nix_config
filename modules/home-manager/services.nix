{...}: {
  services = {
    caffeine.enable = true;
    easyeffects.enable = true;
    gnome-keyring.enable = true;

    udiskie = {
      enable = true;
      tray = "never";
    };

    vicinae = {
      enable = true;
      autoStart = true;
    };
  };
}
