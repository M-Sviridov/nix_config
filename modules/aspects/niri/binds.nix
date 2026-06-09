{...}: {
  my.niri.homeManager = {
    programs.niri = {
      settings.binds = let
        leaderKey = "Super";
      in {
        "${leaderKey}+q".action.spawn = "ghostty";
        "${leaderKey}+f".action.spawn = "zen-twilight";
        "${leaderKey}+e".action.spawn = "nautilus";
        "${leaderKey}+c".action.close-window = [];
        "${leaderKey}+h".action.focus-column-or-monitor-left = [];
        "${leaderKey}+l".action.focus-column-or-monitor-right = [];
        "${leaderKey}+Shift+h".action.move-column-left = [];
        "${leaderKey}+Shift+l".action.move-column-right = [];
        "${leaderKey}+j".action.focus-window-or-workspace-down = [];
        "${leaderKey}+k".action.focus-window-or-workspace-up = [];
        "${leaderKey}+Shift+j".action.move-window-to-workspace-down = [];
        "${leaderKey}+Shift+k".action.move-window-to-workspace-up = [];
        "${leaderKey}+t".action.toggle-window-floating = [];
        "${leaderKey}+o".action.toggle-overview = [];
        "${leaderKey}+m".action.maximize-column = [];
        "${leaderKey}+r".action.switch-preset-column-width = [];
        "Ctrl+1".action.focus-workspace = 1;
        "Ctrl+2".action.focus-workspace = 2;
        "Ctrl+3".action.focus-workspace = 3;
        "Ctrl+4".action.focus-workspace = 4;
        "Ctrl+5".action.focus-workspace = 5;
        "Ctrl+Alt+1".action.screenshot = [];
        "Ctrl+Alt+2".action.screenshot-screen = [];
        "Ctrl+Alt+3".action.screenshot-window = [];
        "${leaderKey}+n".action.spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "notifications"
        ];
        "${leaderKey}+v".action.spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "clipboard"
        ];
        "Ctrl+Alt+q".action.spawn = [
          "noctalia"
          "msg"
          "session"
          "lock"
        ];
        "Ctrl+Space".action.spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "launcher"
        ];
        "XF86AudioRaiseVolume".action.spawn = [
          "noctalia"
          "msg"
          "volume-up"
        ];
        "XF86AudioLowerVolume".action.spawn = [
          "noctalia"
          "msg"
          "volume-down"
        ];
        "XF86AudioMute".action.spawn = [
          "noctalia"
          "msg"
          "volume-mute"
        ];
        "XF86AudioNext".action.spawn = [
          "noctalia"
          "msg"
          "media"
          "next"
        ];
        "XF86AudioPlay".action.spawn = [
          "noctalia"
          "msg"
          "media"
          "toggle"
        ];
        "XF86AudioPrev".action.spawn = [
          "noctalia"
          "msg"
          "media"
          "previous"
        ];
        "XF86MonBrightnessDown".action.spawn = [
          "noctalia"
          "msg"
          "brightness-down"
        ];
        "XF86MonBrightnessUp".action.spawn = [
          "noctalia"
          "msg"
          "brightness-up"
        ];
      };
    };
  };
}
