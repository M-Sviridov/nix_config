{inputs, ...}: {
  flake-file.inputs = {
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  my.niri.nixos = {pkgs, ...}: {
    nixpkgs.overlays = [inputs.niri.overlays.niri];
    nix.settings.substituters = ["https://niri.cachix.org"];

    environment.variables.NIXOS_OZONE_WL = "1";
    environment.systemPackages = [pkgs.xwayland-satellite];

    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    services.udisks2.enable = true;
  };

  my.niri.homeManager = {pkgs, ...}: {
    imports = [
      inputs.niri.homeModules.niri
    ];

    home.packages = [pkgs.nautilus];

    programs.niri = {
      enable = true;

      settings = {
        animations = {
          enable = true;
          slowdown = 0.5;
        };
        # hotkey-overlay.skip-at-startup = true;

        input = {
          focus-follows-mouse.enable = true;

          keyboard = {
            repeat-delay = 200;
            repeat-rate = 50;
            track-layout = "global";
            xkb.layout = "us,th,fr,ru";
          };
        };

        layout = {
          always-center-single-column = true;

          border = {
            enable = true;
            width = 4;
          };

          focus-ring.enable = false;
          gaps = 6;
          shadow.enable = true;
          struts.left = 2;
          struts.right = 2;

          tab-indicator = {
            enable = true;
            position = "top";
          };
        };

        prefer-no-csd = true;
        screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d %H-%M-%S.png";

        window-rules = [
          {
            clip-to-geometry = true;
            draw-border-with-background = false;
            geometry-corner-radius = let
              r = 8.0;
            in {
              top-left = r;
              top-right = r;
              bottom-left = r;
              bottom-right = r;
            };
          }
          {
            matches = [
              {
                app-id = "^zen-twilight$";
              }
            ];
            open-maximized = true;
          }
          {
            matches = [
              {app-id = "^org.gnome.Nautilus$";}
            ];
            open-floating = true;
          }
          {
            matches = [{app-id = "steam";}];
            open-floating = true;
          }
          {
            matches = [{app-id = "^steam_app_.*$";}];
            open-fullscreen = true;
            focus-ring.enable = false;
            border.enable = false;
          }
          {
            matches = [{app-id = "gamescope";}];
            open-fullscreen = true;
            focus-ring.enable = false;
            border.enable = false;
          }
        ];
      };
    };

    services = {
      gnome-keyring.enable = true;
      udiskie = {
        enable = true;

        settings = {
          file_manager = "xdg-open";
        };
      };
    };
  };
}
