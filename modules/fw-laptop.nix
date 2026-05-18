{
  den.aspects.fw-laptop = {
    nixos = {pkgs, ...}: {
      services = {
        avahi = {
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
        };
        gnome.sushi.enable = true;
        gvfs.enable = true;
        upower.enable = true;

        pipewire = {
          # opens UDP ports 6001-6002
          raopOpenFirewall = true;

          extraConfig.pipewire = {
            "10-airplay" = {
              "context.modules" = [
                {
                  name = "libpipewire-module-raop-discover";

                  # increase the buffer size if you get dropouts/glitches
                  # args = {
                  #   "raop.latency.ms" = 500;
                  # };
                }
              ];
            };
          };
        };

        printing.enable = true;
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
