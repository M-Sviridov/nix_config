{...}: {
  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;

    layout = {
      "bar.layouts" = {
        "*" = {
          left = ["dashboard" "workspaces"];
          middle = ["media"];
          right = ["bluetooth" "network" "systray" "volume" "battery" "clock" "notifications"];
        };
      };
    };

    settings = {
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
          };

          outer_spacing = "0.3em";
          transparent = true;
        };

        font = {
          name = "Noto Sans";
          size = "1.2rem";
          weight = 600;
        };
      };

      wallpaper = {
        enable = true;
        image = "/home/msviridov/Downloads/wp11912480-3539545141.png";
      };
    };
  };
}
