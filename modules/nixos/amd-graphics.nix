{pkgs, ...}: {
  environment.sessionVariables = {
    VDPAU_DRIVER = "radeonsi";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  services.xserver = {
    # enable = true;
    videoDrivers = ["amdgpu"];
  };
}
