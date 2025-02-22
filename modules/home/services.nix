{...}: {
  services = {
    mpris-proxy.enable = true;
    gammastep = {
      enable = true;

      latitude = 48.40;
      longitude = 2.70;

      temperature = {
        day = 6500;
        night = 2500;
      };

      provider = "manual";
    };
  };
}
