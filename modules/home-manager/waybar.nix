{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin-top = 5;
        margin-bottom = 5;
        modules-left = ["clock" "hyprland/window"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["wireplumber" "battery" "network"];

        "battery" = {
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          tooltip-format = "Battery is at {capacity}%";
        };

        "clock" = {
          format = "󰥔 {:%H:%M}";
          format-alt = "󰥔 {:%a, %d. %b  %I:%M %p}";
          tooltip-format = "Date: {:%Y-%m-%d}";
        };

        "network" = {
          interface = "wlp1s0";
          format = "{ifname}";
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰈀 {ipaddr}/{cidr}";
          format-disconnected = "󰤭 Disconnected";
          max-length = 50;
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          tooltip-format = "Connected to {essid}";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "๑";
            "2" = "๒";
            "3" = "๓";
            "4" = "๔";
            "5" = "๕";
          };
          "persistent-workspaces" = {
            "*" = 5;
          };
          sort-by-number = true;
        };

        "hyprland/window" = {
          format = "{class}";
          separate-outputs = true;
          icon = false;
          rewrite = {
            "zen-twilight" = "Zen";
            "com.mitchellh.ghostty" = "Ghostty";
            "org.wezfurlong.wezterm" = "Wezterm";
          };
        };

        "wireplumber" = {
          format = "{icon} {volume}%";
          format-bluetooth = "󰂱 {volume}%";
          format-muted = "󰖁";
          scroll-step = 1;
          on-click = "pavucontrol";
          ignored-sinks = ["Easy Effects Sink"];
          format-icons = {
            headphone = "";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            default = ["󰖀" "󰕾"];
          };
          tooltip-format = "Volume: {volume}%";
        };
      };
    };

    style = ''
      @import url("/home/msviridov/.config/waybar/mocha.css");

      * {
        border-radius: 50px;
        font-family: JetBrainsMono Nerd Font Propo, sans-serif;
        font-size: 15px;
        font-weight: bold;
      }

      window#waybar {
        background-color: transparent;
        color: @foreground;
      }

      .modules-right {
        margin-right: 12px;
      }

      #workspaces {
        background-color: @surface_container_low;
        font-family: Noto Sans Thai;
        padding: 2px 2px 2px 2px;
        border-radius: 50px;
        margin-left: 12px;
      }

      #workspaces button.active {
        background-color: @primary_fixed_dim;
        color: @on_primary_fixed;
        padding: 5px 24px;
      }

      #workspaces button.active:hover {
        color: @primary_fixed_dim;
        background: inherit;
      }

      #workspaces button.empty {
        color: @outline_variant;
      }

      #workspaces button {
        background-color: transparent;
        color: @mauve;
        transition: margin 150ms ease-in-out, padding 150ms ease-in-out;
        transition: background-color 0.3s ease, color 0.3s ease, padding 0.2s ease;
      }

      #workspaces button:hover {
        background: @surface_container_high;
      }

      #workspaces button.urgent {
        background-color: @error;
        color: @on_error;
      }

      #battery,
      #wireplumber,
      #backlight,
      #custom-pacman,
      #network,
      #clock,
      #custom-weather,
      #custom-media,
      #window,
      #cpu,
      #memory,
      #disk,
      #tray,
      #custom-launcher,
      #custom-notification,
      #custom-github,
      #power-profiles-daemon {
        color: @primary;
        background-color: @surface_container;
        padding: 0 15px 0 15px;
        margin: 0 0 0 12px;
      }

      #battery {
        color: @red;
      }

      #clock {
        color: @peach;
      }

      #network {
        color: @mauve;
      }

      #wireplumber {
        color: @green;
      }

      #custom-launcher,
      #custom-notification {
        color: @red;
      }

      #window.hidden {
        opacity: 0;
        min-width: 0;
        min-height: 0;
        padding: 0;
        margin: 0;
        border: none;
      }

      window#waybar.empty #window {
        background-color: transparent;
      }
    '';
  };
}
