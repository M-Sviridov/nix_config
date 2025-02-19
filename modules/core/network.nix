{host, ...}: {
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
  };
}
