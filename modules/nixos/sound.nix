{pkgs, ...}: {
  security.rtkit.enable = true;

  services = {
    avahi.enable = true;
    pipewire = {
      enable = true;
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

      alsa = {
        enable = true;
        support32Bit = true;
      };

      extraLv2Packages = with pkgs; [
        calf
        lsp-plugins
      ];

      pulse.enable = true;
    };
  };
}
