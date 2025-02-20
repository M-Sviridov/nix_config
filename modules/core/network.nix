{host, ...}: {
  networking = {
    firewall = {
      enable = true;
    };

    hostName = "${host}";
    networkmanager.enable = true;
    nftables.enable = true;
  };
}
