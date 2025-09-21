{pkgs, ...}: {
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    displayManager.gdm.enable = true;
    fwupd.enable = true;
    gvfs.enable = true;
    openssh.enable = true;
    printing.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };
}
