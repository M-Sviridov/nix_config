{
  # host aspect
  den.aspects.fw-laptop = {
    # host NixOS configuration
    nixos = {pkgs, ...}: {
      services.upower.enable = true;

      environment.systemPackages = with pkgs; [
        tree
      ];

      hardware = {
        amdgpu.opencl.enable = true;

        graphics = {
          enable = true;
          enable32Bit = true;
        };
      };
    };

    # host provides default home environment for its users
    # homeManager = {pkgs, ...}: {
    #   home.packages = [pkgs.bitwarden-desktop];
    # };
  };
}
