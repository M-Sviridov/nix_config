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
      };
    };
  };
}
