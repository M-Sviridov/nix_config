{...}: {
  services.gammastep = {
    enable = true;

    latitude = 8.03;
    longitude = 98.33;

    temperature = {
      day = 6500;
      night = 2500;
    };

    provider = "manual";
  };
}
