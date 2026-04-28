{inputs, ...}: {
  flake-file.inputs = {
    danksearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  my.niri.nixos = {
    programs.kdeconnect.enable = true;
  };

  my.niri.homeManager = {pkgs, ...}: {
    imports = [
      inputs.danksearch.homeModules.dsearch
      inputs.dms.homeModules.dank-material-shell
      inputs.dms.homeModules.niri
      inputs.dms-plugin-registry.modules.default
    ];

    home.packages = [
      pkgs.libqalculate
      pkgs.sshfs
    ];

    programs = {
      dank-material-shell = {
        enable = true;
        enableSystemMonitoring = true;
        enableVPN = true;
        enableAudioWavelength = true;
        enableCalendarEvents = true;
        enableClipboardPaste = true;

        niri = {
          enableSpawn = true;
          includes = {
            enable = true;
            override = true;
            originalFileName = "hm";
            filesToInclude = [
              "alttab"
              "binds"
              "colors"
              "cursor"
              "layout"
              "outputs"
              "windowrules"
              "wpblur"
            ];
          };
        };

        plugins = {
          calculator.enable = true;
          dankBatteryAlerts.enable = true;
          dankBitwarden.enable = true;
          dankGifSearch.enable = true;
          dankKDEConnect.enable = true;
          emojiLauncher.enable = true;
        };
      };

      dsearch.enable = true;
    };

    services.kdeconnect.enable = true;
  };
}
