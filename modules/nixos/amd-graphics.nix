{pkgs, ...}: {
  environment.sessionVariables = {
    VDPAU_DRIVER = "radeonsi";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  services.xserver = {
    # enable = true;
    videoDrivers = ["amdgpu"];
  };
}
