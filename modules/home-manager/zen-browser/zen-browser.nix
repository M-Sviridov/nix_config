{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables.MOZ_LEGACY_PROFILES = 1;

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];

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
          "https://auth.msviridov.com/"
          "https://chatgpt.com/"
          "https://claude.ai/"
          "https://github.com/"
          "https://google.com/"
          "https://jellyfin.lan.msviridov.com/"
          "https://jellyseerr.msviridov.com/"
          "https://mistral.ai/"
          "https://ntfy.lan.msviridov.com/"
          "https://proton.me/"
          "https://reddit.com/"
          "https://soundcloud.com/"
          "https://t.coros.com/admin/views/dash-board"
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
        "Admin" = {
          color = "red";
          icon = "fingerprint";
          id = 3;
        };

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
        "Admin" = {
          container = containers."Admin".id;
          id = "01dbd71a-0eb0-4dbe-a6bc-6bbb4f2670ff";
          icon = "🫆";
          position = 3000;
        };

        "Personal" = {
          container = containers."Personal".id;
          id = "1198a8cf-c49d-481f-a0d6-487f16c90220";
          icon = "💻";
          position = 1000;
        };

        "Work" = {
          container = containers."Work".id;
          id = "30e5feb9-eb6b-4c59-8588-d1e9a6b777e3";
          icon = "🦐";
          position = 2000;
        };
      };

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        catppuccin-web-file-icons
        karakeep
        multi-account-containers
        proton-pass
        skip-redirect
        sponsorblock
        stylus
        ublock-origin
        vimium
        yomitan
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
        "media.videocontrols.picture-in-picture.enable-when-switching-tabs.enabled" = true;
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
}
