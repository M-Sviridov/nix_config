{pkgs, ...}: {
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    displayManager.sddm = {
      enable = true;
      enableHidpi = false;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
    };

    fwupd.enable = true;
    gvfs.enable = true;
    openssh.enable = true;
    printing.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };
}
