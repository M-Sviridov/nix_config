{
  den,
  inputs,
  ...
}: {
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

    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
  };

  my.niri.homeManager = {config, ...}: {
    imports = [
      inputs.niri.homeModules.niri
    ];

    programs.niri = {
      enable = true;

      settings = {
        animations.enable = false;
        binds = let
          leaderKey = "Super";
        in {
          "${leaderKey}+q".action.spawn = "ghostty";
          "${leaderKey}+f".action.spawn = "firefox";
          "${leaderKey}+c".action.close-window = [];
          "${leaderKey}+h".action.focus-column-or-monitor-left = [];
          "${leaderKey}+l".action.focus-column-or-monitor-right = [];
          "${leaderKey}+j".action.focus-window-or-workspace-down = [];
          "${leaderKey}+k".action.focus-window-or-workspace-up = [];
          "${leaderKey}+n".action.spawn = [
            "dms"
            "ipc"
            "notifications"
            "toggle"
          ];
          "${leaderKey}+v".action.spawn = [
            "dms"
            "ipc"
            "clipboard"
            "toggle"
          ];
          "Ctrl+Alt+q".action.spawn = [
            "dms"
            "ipc"
            "lock"
            "lock"
          ];
          "Ctrl+Space".action.spawn = [
            "dms"
            "ipc"
            "spotlight"
            "toggle"
          ];
          "XF86AudioRaiseVolume".action.spawn = [
            "dms"
            "ipc"
            "audio"
            "increment"
            "5"
          ];
          "XF86AudioLowerVolume".action.spawn = [
            "dms"
            "ipc"
            "audio"
            "decrement"
            "5"
          ];
          "XF86AudioMute".action.spawn = [
            "dms"
            "ipc"
            "audio"
            "mute"
          ];
          "XF86AudioNext".action.spawn = [
            "dms"
            "ipc"
            "mpris"
            "next"
          ];
          "XF86AudioPlay".action.spawn = [
            "dms"
            "ipc"
            "mpris"
            "playPause"
          ];
          "XF86AudioPrev".action.spawn = [
            "dms"
            "ipc"
            "mpris"
            "previous"
          ];
          "XF86MonBrightnessDown".action.spawn = [
            "dms"
            "ipc"
            "brightness"
            "decrement"
            "5"
            ""
          ];
          "XF86MonBrightnessUp".action.spawn = [
            "dms"
            "ipc"
            "brightness"
            "increment"
            "5"
            ""
          ];
        };

        prefer-no-csd = true;
        window-rules = [
          {
            geometry-corner-radius = let
              r = 8.0;
            in {
              top-left = r;
              top-right = r;
              bottom-left = r;
              bottom-right = r;
            };
            clip-to-geometry = true;
          }
        ];
      };
    };
  };
}
