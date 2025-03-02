{host, ...}: {
  networking = {
    firewall = {
      checkReversePath = false;
    };

    hostName = "${host}";
    networkmanager.enable = true;
    nftables.enable = true;
  };
}
