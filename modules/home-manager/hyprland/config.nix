{...}: {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "eDP-1,preferred,auto,auto"
        "DP-3,preferred,auto,auto"
      ];

      exec-once = [
        # "uwsm app -- bitwarden-desktop"
      ];

      "plugin:hyprsplit" = {
        num_workspaces = 5;
        persistent_workspaces = true;
      };

      "plugin:hyprgrass" = {
        touch_gestures = {
          workspace_swipe_fingers = 3;
        };
      };

      input = {
        kb_layout = "us,th";
        kb_options = ["grp:win_space_toggle"];
        follow_mouse = 1;
        sensitivity = 0.2; # -1.0 - 1.0, 0 means no modification.
        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.2;
        };
        repeat_delay = 200;
        repeat_rate = 50;
      };

      general = {
        "$mainMod" = "SUPER";
        "$browser" = "zen";
        "$terminal" = "wezterm";
        "$fileManager" = "nautilus";
        "$menu" = "tofi-drun --drun-launch=true";
        gaps_in = 4;
        gaps_out = "2,8,8,8";
        border_size = 2;
        layout = "dwindle";
        resize_on_border = true;
        "col.active_border" = "rgba(cba6f7ee) rgba(f5e0dcee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };

      # gestures = {
      #   workspace_swipe = true;
      #   workspace_swipe_cancel_ratio = 0.15;
      # };

      decoration = {
        blur = {
          enabled = true;
          passes = 4;
          size = 5;
          special = true;
          vibrancy = 0.1696;
          xray = true;
        };

        dim_special = 0.3;
        inactive_opacity = 0.9;

        rounding = 10;
        shadow.enabled = true;
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        focus_on_activate = true;
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
        vrr = 1;
      };

      bind = [
        "$mainMod, E, exec, uwsm app -- $fileManager"
        "$mainMod, Q, exec, uwsm app -- $terminal"
        "$mainMod, O, exec, hyprctl dispatch exit"
        "$mainMod, F, exec, uwsm app -- $browser -p msviridov"
        "$mainMod, D, exec, uwsm app -- $browser -p lg27"
        "ctrl alt, 1, exec, uwsm app -- hyprshot -m region"
        "ctrl alt, 2, exec, uwsm app -- hyprshot -m window"
        "ctrl alt, 3, exec, uwsm app -- hyprshot -m output"
        "ctrl, space, exec, uwsm app -- $menu"
        "$mainMod, T, togglefloating"
        "ctrl alt, Q, exec, hyprlock"
        "$mainMod, p, togglesplit"
        "$mainMod, c, killactive"
        "$mainMod, m, fullscreen"
        "ctrl, 1, split:workspace, 1"
        "ctrl, 2, split:workspace, 2"
        "ctrl, 3, split:workspace, 3"
        "ctrl, 4, split:workspace, 4"
        "ctrl, 5, split:workspace, 5"
        "ctrl SHIFT, 1, split:movetoworkspace, 1"
        "ctrl SHIFT, 2, split:movetoworkspace, 2"
        "ctrl SHIFT, 3, split:movetoworkspace, 3"
        "ctrl SHIFT, 4, split:movetoworkspace, 4"
        "ctrl SHIFT, 5, split:movetoworkspace, 5"
        "$mainMod, R, split:grabroguewindows"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        "$mainMod, 1, movewindow, mon:eDP-1"
        "$mainMod, 2, movewindow, mon:DP-2"
        "$mainMod, S, togglespecialworkspace, magic"
        "ctrl SHIFT, S, split:movetoworkspace, special:magic"
        "$mainMod, V, exec, uwsm app -- $terminal start --class clipse -e 'clipse'"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl previous"
      ];

      layerrule = [
        "blur,vicinae"
        "ignorealpha 0, vicinae"
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "size 622 652, class:(clipse)"
        "float, class:(clipse)"
        "dimaround, class:(clipse)"
        "float, class:(org.gnome.NautilusPreviewer)"
        "size 933 652, class:(org.gnome.NautilusPreviewer)"
        "float, class:(org.gnome.Nautilus)"
        "size 1000 652, class:(org.gnome.Nautilus)"
        "float, title:(.*)(Extension)"
        "float, class:^Bitwarden$,title:^(Bitwarden)"
        "size 1000 652, class:(Bitwarden)"
      ];

      workspace = [
        "special:magic, gapsout:100"
        "special:magic, on-created-empty:uwsm app -- $terminal"
      ];
    };
  };
}
