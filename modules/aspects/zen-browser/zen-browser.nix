{inputs, ...}: {
  flake-file.inputs = {
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.home-manager.follows = "home-manager";
    };
  };

  my.zen-browser.homeManager = {
    config,
    pkgs,
    ...
  }: {
    imports = [inputs.zen-browser.homeModules.twilight];
    nixpkgs.overlays = [inputs.nur.overlays.default];

    home.file = {
      ".config/zen/default/chrome/userChrome.css" = {
        source = ./userChrome.css;
      };
      ".config/zen/default/chrome/userContent.css" = {
        source = ./userContent.css;
      };
      ".config/zen/default/chrome/zen-logo-mocha.svg" = {
        source = ./zen-logo-mocha.svg;
      };
    };

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;

      languagePacks = [
        "en-US"
        "fr"
        "ru"
        "th"
      ];

      policies = {
        AppAutoUpdate = false;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;

        Cookies = {
          Allow = [
            "https://actual.lan.msviridov.com/"
            "https://auth.msviridov.com/"
            "https://bandcamp.com/"
            "https://books.msviridov.com/"
            "https://claude.ai/"
            "https://t.coros.com/"
            "https://github.com/"
            "https://intervals.icu/"
            "https://jellyfin.lan.msviridov.com/"
            "https://jellyseerr.msviridov.com/"
            "https://mistral.ai/"
            "https://ntfy.lan.msviridov.com/"
            "https://plex.lan.msviridov.com/"
            "https://proton.me/"
            "https://qui.lan.msviridov.com/"
            "https://reddit.com/"
            "https://seerr.lan.msviridov.com/"
            "https://soundcloud.com/"
            "https://squash.tv/"
            "https://trakt.tv/"
            "https://ui.com/"
            "https://web.whatsapp.com/"
            "https://youtube.com/"
          ];

          Behavior = "reject-tracker-and-partition-foreign";
        };

        DefaultDownloadDirectory = "${config.xdg.userDirs.download}";
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        DisableFormHistory = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisplayMenuBar = "never";

        EnableTrackingProtection = {
          Value = true;
          Cryptomining = true;
          Fingerprinting = true;
        };

        FirefoxSuggest = {
          ImproveSuggest = false;
          SponsoredSuggestions = false;
          WebSuggestions = false;
        };

        HardwareAcceleration = true;
        HttpsOnlyMode = "enabled";
        MoreFromMozilla = false;
        NetworkPrediction = false;
        OfferToSaveLogins = false;
        PasswordManagerEnabled = false;

        PictureInPicture = {
          Enabled = true;
        };

        PrintingEnabled = true;
        PromptForDownloadLocation = false;
        RequestedLocales = ["en-US" "fr" "th" "ru"];

        SanitizeOnShutdown = {
          Cookies = true;
          FormData = true;
          History = true;
        };

        SearchSuggestEnabled = false;
        ShowHomeButton = false;
      };

      profiles."default" = {
        id = 0;
        isDefault = true;
        containersForce = true;
        spacesForce = true;

        containers = {
          "Personal" = {
            color = "purple";
            icon = "circle";
            id = 1;
          };

          "Work" = {
            color = "blue";
            icon = "briefcase";
            id = 2;
          };
        };

        spaces = let
          containers = config.programs.zen-browser.profiles."default".containers;
        in {
          "Personal" = {
            container = containers."Personal".id;
            id = "1198a8cf-c49d-481f-a0d6-487f16c90220";
            icon = "💻";
            position = 1000;
          };

          "Work" = {
            container = containers."Work".id;
            id = "30e5feb9-eb6b-4c59-8588-d1e9a6b777e3";
            icon = "💼";
            position = 2000;
          };
        };

        pins = let
          containers = config.programs.zen-browser.profiles."default".containers;
        in {
          "Dockge" = {
            id = "f4ad963a-09ca-4a61-8b0b-03803db8c934";
            container = containers.Personal.id;
            url = "https://dockge.lan.msviridov.com";
            isEssential = true;
            position = 100;
          };
          "Grafana" = {
            id = "121ce38d-3a67-445c-8fda-3006bc356902";
            container = containers.Personal.id;
            url = "https://grafana.lan.msviridov.com";
            isEssential = true;
            position = 101;
          };
          "ProtonDrive" = {
            id = "0822516b-9bb1-4164-8ad8-a219643d2d38";
            container = containers.Personal.id;
            url = "https://drive.proton.me";
            isEssential = true;
            position = 102;
          };
          "ProtonMail" = {
            id = "5c38d6ea-1d11-4790-b9a2-a2befb5a07ae";
            container = containers.Personal.id;
            url = "https://mail.proton.me";
            isEssential = true;
            position = 103;
          };
        };

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          catppuccin-web-file-icons
          cliget
          karakeep
          link-gopher
          multi-account-containers
          proton-pass
          skip-redirect
          sponsorblock
          stylus
          ublock-origin
          vimium
          violentmonkey
          yomitan
        ];

        mods = [
          "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
          "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
          "1e86cf37-a127-4f24-b919-d265b5ce29a0" # Lean
        ];

        search = {
          default = "ddg";
          engines = {
            "amazondotcom-us".metaData.hidden = true;
            "bing".metaData.hidden = true;
            "ebay".metaData.hidden = true;
            "google".metaData.hidden = true;
            "wikipedia".metaData.hidden = true;
          };

          force = true;
          order = ["ddg"];
          privateDefault = "ddg";
        };

        settings = {
          ## GENERAL ##
          "browser.preferences.defaultPerformanceSettings.enabled" = false;

          ## UI RESPONSIVENES ##
          "ui.submenuDelay" = 0;
          "dom.element.animate.enabled" = true;
          "mousewheel.min_line_scroll_amount" = 15;
          "mousewheel.scroll_series_timeout" = 10;

          ## MEDIA & CODECS ##
          "dom.media.webcodecs.h265.enabled" = true;
          "media.videocontrols.picture-in-picture.enable-when-switching-tabs.enabled" = false;
          "media.ffmpeg.vaapi.enabled" = true;
          "media.hardware-video-decoding.force-enabled" = true;

          ## LINUX SPECIFIC ##
          "widget.wayland.opaque-region.enabled" = true;
          "widget.wayland.fractional-scale.enabled" = true;

          ## ZEN SPECIFIC & AI TOOLS ##
          "reader.parse-on-load.enabled" = false;
          "zen.urlbar.behavior" = "float";
          "zen.welcome-screen.seen" = true;
        };
      };
    };
  };
}
