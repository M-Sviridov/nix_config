{inputs, ...}: {
  flake-file.inputs = {
    niri = {
      url = "github:epireyn/niri-flake";
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

        cursor = {
          size = 24;
          theme = "BreezeX-RosePine-Linux";
        };

        debug = {
          honor-xdg-activation-with-invalid-serial = [];
        };
        # hotkey-overlay.skip-at-startup = true;

        input = {
          focus-follows-mouse.enable = true;

          keyboard = {
            repeat-delay = 200;
            repeat-rate = 50;
            track-layout = "global";
            xkb = {
              layout = "us,th,fr,ru";
              options = "grp:win_space_toggle";
            };
          };
        };

        layout = {
          always-center-single-column = true;

          border = {
            enable = true;
            active.color = "#cba6f7";
            urgent.color = "#f38ba8";
            width = 2;
          };

          default-column-width = {proportion = 0.5;};

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

        outputs = {
          "DP-2".position.x = -2560;
          "DP-2".position.y = 0;
          "eDP-1".position.x = 0;
          "eDP-1".position.y = 240;
        };

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
            matches = [{app-id = "^zen-twilight$";}];
            open-maximized = true;
          }
          {
            matches = [{app-id = "^org.gnome.Nautilus$";}];
            open-floating = true;
            default-column-width.fixed = 1380;
            default-window-height.fixed = 920;
          }
          {
            matches = [{app-id = "^org.gnome.Nautilus$";}];
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
          {
            matches = [{app-id = "^org\.gnome\.NautilusPreviewer$";}];
            open-floating = true;
            default-column-width.fixed = 900;
            default-window-height.fixed = 700;
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
