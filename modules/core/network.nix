{host, ...}: {
  networking = {
    firewall = {
      enable = true;
    };

    hostName = "${host}";
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
  };
}
