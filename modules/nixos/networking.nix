{hostname, ...}: {
  networking = {
    firewall.checkReversePath = false;
    hostName = "${hostname}";
    networkmanager.enable = true;
  };
}
