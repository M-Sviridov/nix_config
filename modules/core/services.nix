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
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    fwupd.enable = true;
    gnome.sushi.enable = true;
    gvfs.enable = true;

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["0001:0001:70533846"];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              leftcontrol = "layer(meta)";
              leftmeta = "layer(control)";
              rightcontrol = "layer(meta)";
              rightmeta = "layer(control)";
              shift = "oneshot(shift)";
            };
          };
        };
        # externalKeyboard = {
        #   ids = [ "1ea7:0907" ];
        #   settings = {
        #     main = {
        #       esc = capslock;
        #     };
        #   };
        # };
      };
    };

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
      SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="${pkgs.power-profiles-daemon}/bin/powerprofilesctl set power-saver'"
      SUBSYSTEM=="power_supply", ATTR{online}=="1", RUN+="${pkgs.power-profiles-daemon}/bin/powerprofilesctl set performance'"
    '';
  };
}
