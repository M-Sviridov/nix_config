{pkgs, ...}: {
  security = {
    rtkit.enable = true;
    pam = {
      services.hyprlock = {};
      services.sudo = {};
    };
  };

  systemd.services.fprintd = {
    wantedBy = ["multi-user.target"];
    serviceConfig.Type = "simple";
  };

  # Services to start
  services = {
    avahi.enable = true;

    fwupd.enable = true;
    gvfs.enable = true;

    pipewire = {
      enable = true;
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
      alsa.enable = true;
      alsa.support32Bit = true;
      # jack.enable = true; # comment or uncomment depending on needs
      pulse.enable = true;
      raopOpenFirewall = true;
      wireplumber = {
        enable = true;
        extraLv2Packages = with pkgs; [
          calf
          lsp-plugins
        ];
      };
    };

    solaar = {
      enable = true;
      window = "hide";
      batteryIcons = "solaar";
    };

    tailscale = {
      enable = true;
      authKeyFile = "/run/secrets/tailscale_key";
      extraUpFlags = ["--accept-dns" "--accept-routes"];
    };

    upower.enable = true;

    udev.extraRules = ''
      SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="/nix/store/2fhf6cmy9jf9yp1bw5b68a71b3rqs60w-power-profiles-daemon-0.30/bin/powerprofilesctl set power-saver"
      SUBSYSTEM=="power_supply", ATTR{online}=="1", RUN+="/nix/store/2fhf6cmy9jf9yp1bw5b68a71b3rqs60w-power-profiles-daemon-0.30/bin/powerprofilesctl set performance"
    '';
  };
}
