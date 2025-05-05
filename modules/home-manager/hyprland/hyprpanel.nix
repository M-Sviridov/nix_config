{user, ...}: {
  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overlay.enable = true;
    overwrite.enable = true;

    settings = {
      layout = {
        "bar.layouts" = {
          "*" = {
            left = ["dashboard" "workspaces"];
            middle = ["media"];
            right = ["network" "systray" "volume" "battery" "clock" "notifications"];
          };
        };
      };

      bar = {
        autoHide = "fullscreen";
        bluetooth.label = false;
        clock.format = "%a %b %d  %H:%M";
        media.show_active_only = true;
        network.label = false;
        workspaces.ignored = "-98";
      };

      menus = {
        clock = {
          time = {
            hideSeconds = false;
            military = true;
          };

          weather = {
            enabled = true;
            interval = 30000;
            key = "dd98f4cb33b144528b083444250401";
            location = "Fontainebleau, France";
            unit = "metric";
          };
        };

        media = {
          displayTime = true;
          displayTimeTooltip = true;
          hideAlbum = false;
          hideAuthor = false;
        };
      };

      scalingPriority = "hyprland";
      tear = false;
      terminal = "$TERM";

      theme = {
        bar = {
          border_radius = "0.4em";

          buttons = {
            padding_y = "0.2rem";
            radius = "0.5em";
            spacing = "0.25em";
            y_margins = "0.4em";
          };

          margin_sides = "0.5em";
          margin_top = "0.5em";

          menus = {
            border.radius = "0.7em";
            border.size = "0.13em";
            buttons.radius = "0.4em";
            card_radius = "0.4em";

            menu = {
              battery.scaling = 90;
              bluetooth.scaling = 90;
              clock.scaling = 90;
              dashboard.confirmation_scaling = 90;
              dashboard.scaling = 90;
              media.scaling = 90;
              network.scaling = 90;
              notifications.scaling = 90;
              power.scaling = 90;
              volume.scaling = 90;
            };

            popover.scaling = 90;
          };

          outer_spacing = "0.3em";
          scaling = 95;
          transparent = true;
        };

        font = {
          name = "Noto Sans";
          size = "1.0rem";
          weight = 600;
        };

        notification.scaling = 90;
        osd.scaling = 95;
        tooltip.scaling = 90;
      };

      wallpaper = {
        enable = true;
        image = "/home/${user}/Pictures/catppuccin/cat_ef_ign_unsplash46.png";
      };
    };
  };
}
