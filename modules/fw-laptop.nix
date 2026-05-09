{
  den.aspects.fw-laptop = {
    nixos = {pkgs, ...}: {
      services = {
        gnome.sushi.enable = true;
        gvfs.enable = true;
        upower.enable = true;
      };

      environment.systemPackages = with pkgs; [
        tree
      ];

      hardware = {
        amdgpu.opencl.enable = true;
        fw-fanctrl.enable = true;

        graphics = {
          enable = true;
          enable32Bit = true;
        };
      };
    };
  };
}
