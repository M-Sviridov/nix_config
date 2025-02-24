{pkgs-nur, ...}: {
  programs.firefox = {
    enable = true;

    languagePacks = [
      "en-US"
      "fr"
      "ru"
      "th"
    ];

    policies = {
      AppAutoUpdate = false;

      Cookies = {
        Allow = [
          "https://chatgpt.com/"
          "https://claude.ai/"
          "https://github.com/"
          "https://perplexity.ai/"
          "https://proton.me/"
          "https://soundcloud.com/"
          "https://todo.lan.msviridov.com/"
          "https://youtube.com/"
        ];
        Behavior = "reject-tracker-and-partition-foreign";
      };

      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisablePocket = true;
      DisableTelemetry = true;

      DNSOverHTTPS = {
        Enabled = false;
        Locked = true;
      };

      FirefoxSuggest = {
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };

      HardwareAcceleration = true;
      OfferToSaveLogins = false;
    };

    profiles.msviridov = {
      containers."Le Club" = {
        color = "green";
        icon = "briefcase";
        id = 1;
      };

      containersForce = true;

      extensions.packages = with pkgs-nur.nur.repos.rycee.firefox-addons; [
        bitwarden
        catppuccin-gh-file-explorer
        enhancer-for-youtube
        firefox-color
        multi-account-containers
        proton-pass
        return-youtube-dislikes
        skip-redirect
        sponsorblock
        stylus
        tampermonkey
        ublock-origin
        vimium
      ];

      search = {
        default = "DuckDuckGo";
        engines = {
          "Amazon.com".metaData.hidden = true;
          "Bing".metaData.hidden = true;
          "eBay".metaData.hidden = true;
        };

        force = true;
        order = ["DuckDuckGo"];
        privateDefault = "DuckDuckGo";
      };

      settings = {
        # General
        "browser.aboutConfig.showWarning" = false;
        "gfx.webrender.all" = true;
        "gfx.webrender.software" = true;

        # Misc
        "dom.battery.enabled" = false;

        # Privacy
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";
        "browser.discovery.enabled" = false;
        "browser.formfill.enable" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.dnsResolveSingleWordsAfterSearch" = 0;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.search.suggest.enabled" = false;
        "browser.shopping.experience2023.enabled" = true;
        "datareporting.policy.dataSubmissionsEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "network.prefetch-next" = false;
        "network.dns.disablePrefetch" = true;
        "network.predictor.enabled" = false;
        "network.predictor.enable-prefetch" = false;

        # Security
        "dom.forms.autocomplete.formautofill" = false;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_pbm" = true;
        "dom.security.https_only_mode_send_http_background_request" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "extensions.formautofill.heuristics.enabled" = false;
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;

        # Startup
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";
        "browser.startup.homepage" = "https://todo.lan.msviridov.com";

        # UI
        "browser.tabs.inTitlebar" = 0;
        "layout.css.devPixelsPerPx" = 1.7;
      };
    };
  };
}
