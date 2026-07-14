{inputs, ...}: {
  flake-file.inputs = {
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  my.niri.nixos = {pkgs, ...}: {
    imports = [
      inputs.dms-plugin-registry.nixosModules.default
    ];

    programs = {
      dms-shell = {
        enable = true;

        plugins = {
          calculator.enable = true;
          dankBatteryAlerts.enable = true;
          emojiLauncher.enable = true;
        };

        systemd = {
          enable = true;
          restartIfChanged = true;
        };
      };

      dsearch.enable = true;

      kdeconnect = {
        enable = false;
        package = pkgs.valent;
      };
    };
  };

  my.niri.homeManager = {pkgs, ...}: {
    home.packages = [
      pkgs.libqalculate
      pkgs.sshfs
    ];

    programs = {
      niri.settings = let
        leaderKey = "Super";
      in {
        binds = {
          "Ctrl+Alt+1".action.spawn = [
            "dms"
            "ipc"
            "call"
            "niri"
            "screenshot"
          ];
          "Ctrl+Alt+2".action.spawn = [
            "dms"
            "ipc"
            "call"
            "niri"
            "screenshotWindow"
          ];
          "Ctrl+Alt+3".action.spawn = [
            "dms"
            "ipc"
            "call"
            "niri"
            "screenshotScreen"
          ];
          "${leaderKey}+n".action.spawn = [
            "dms"
            "ipc"
            "call"
            "notifications"
            "open"
          ];
          "${leaderKey}+v".action.spawn = [
            "dms"
            "ipc"
            "call"
            "clipboard"
            "toggle"
          ];
          "Ctrl+Alt+q".action.spawn = [
            "dms"
            "ipc"
            "call"
            "lock"
            "lock"
          ];
          "Ctrl+Space".action.spawn = [
            "dms"
            "ipc"
            "call"
            "spotlight-bar"
            "toggle"
          ];
          "XF86AudioRaiseVolume".action.spawn = [
            "dms"
            "ipc"
            "call"
            "audio"
            "increment"
            "5"
          ];
          "XF86AudioLowerVolume".action.spawn = [
            "dms"
            "ipc"
            "call"
            "audio"
            "decrement"
            "5"
          ];
          "XF86AudioMute".action.spawn = [
            "dms"
            "ipc"
            "call"
            "audio"
            "mute"
          ];
          "XF86AudioNext".action.spawn = [
            "dms"
            "ipc"
            "call"
            "mpris"
            "next"
          ];
          "XF86AudioPlay".action.spawn = [
            "dms"
            "ipc"
            "call"
            "mpris"
            "playPause"
          ];
          "XF86AudioPrev".action.spawn = [
            "dms"
            "ipc"
            "call"
            "mpris"
            "previous"
          ];
          "XF86MonBrightnessDown".action.spawn = [
            "dms"
            "ipc"
            "call"
            "brightness"
            "decrement"
            "5"
            ""
          ];
          "XF86MonBrightnessUp".action.spawn = [
            "dms"
            "ipc"
            "call"
            "brightness"
            "increment"
            "5"
            ""
          ];
        };

        layer-rules = [
          {
            matches = [{namespace = "^dms:clipboard$";}];
            block-out-from = "screencast";
          }
          {
            matches = [{namespace = "^quickshell$";}];
            place-within-backdrop = true;
          }
          {
            matches = [{namespace = "^dms:blurwallpaper$";}];
            place-within-backdrop = true;
          }
        ];

        layout = {
          background-color = "transparent";
        };
      };
    };
  };
}
