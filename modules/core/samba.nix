{pkgs, ...}: {
  environment.systemPackages = [pkgs.cifs-utils];

  fileSystems."/mnt/kratos_data" = {
    device = "//kratos/data";
    fsType = "cifs";
    options = let
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},credentials=/etc/nixos/smb-kratos_data-secrets"];
  };
}
