{pkgs, ...}: {
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
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      Cookies = {
        Allow = [
          "https://chatgpt.com/"
          "https://claude.ai/"
          "https://freshrss.lan.msviridov.com/"
          "https://github.com/"
          "https://google.com/"
          "https://haos.lan.leclubavon.com/"
          "https://jellyfin.lan.msviridov.com/"
          "https://jellyseerr.msviridov.com/"
          "https://mistral.ai/"
          "https://ntfy.lan.msviridov.com/"
          "https://proton.me/"
          "https://reddit.com/"
          "https://soundcloud.com/"
          "https://t.coros.com/admin/views/dash-board"
          "https://todo.lan.msviridov.com/"
          "https://ui.com/"
          "https://web.whatsapp.com/"
          "https://youtube.com/"
        ];

        Behavior = "reject-tracker-and-partition-foreign";
      };

      DefaultDownloadDirectory = "\${home}/Downloads/";
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "newtab";
      DisplayMenuBar = "never";

      EnableTrackingProtection = {
        Value = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      DNSOverHTTPS = {
        Enabled = false;
        Locked = true;
      };

      FirefoxSuggest = {
        ImproveSuggest = false;
        SponsoredSuggestions = false;
        WebSuggestions = false;
      };

      HardwareAcceleration = true;

      # Homepage = {
      # };

      HttpsOnlyMode = "enabled";
      MoreFromMozilla = false;
      NetworkPrediction = false;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;

      PictureInPicture = {
        Enabled = false;
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
      ShowHomeButton = true;
    };

    profiles.msviridov = {
      id = 0;

      # bookmarks = {
      #   force = true;
      #
      #   settings = [
      #     {
      #       name = "Homelab";
      #       toolbar = true;
      #       bookmarks = [
      #         {
      #           name = "Dozzle";
      #           url = "https://dozzle.lan.msviridov.com";
      #         }
      #         {
      #           name = "qBittorrent";
      #           url = "https://qbit.lan.msviridov.com";
      #         }
      #       ];
      #     }
      #   ];
      # };

      containers = {
        "Admin" = {
          color = "red";
          icon = "fingerprint";
          id = 1;
        };

        "Le Club" = {
          color = "green";
          icon = "briefcase";
          id = 2;
        };

        "TSST" = {
          color = "yellow";
          icon = "briefcase";
          id = 3;
        };
      };

      containersForce = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        catppuccin-web-file-icons
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
        # FASTFOX

        ## GENERAL
        "content.notify.interval" = 100000;
        "extensions.autoDisableScopes" = 0;

        ## GFX & MEDIA
        "gfx.canvas.accelerated.cache-size" = 512;
        "gfx.content.skia-font-cache-size" = 20;
        # "media.eme.enabled" = true;
        # "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;

        ## DISK CACHE
        "browser.cache.disk.enable" = false;
        "browser.cache.memory.capacity" = 1048576;
        "browser.cache.memory.enable" = true;

        ## MEDIA CACHE
        "media.cache_readahead_limit" = 120;
        "media.cache_resume_threshold" = 60;
        "media.memory_cache_max_size" = 65536;

        ## IMAGE CACHE
        "image.mem.decode_bytes_at_a_time" = 32678;

        ## NETWORK
        "network.dnsCacheExpiration" = 3600;
        "network.http.max-connections" = 1800;
        "network.http.max-persistent-connections-per-server" = 10;
        "network.http.max-urgent-start-excessive-connections-per-host" = 5;
        "network.http.pacing.requests.enabled" = false;
        "network.ssl_tokens_cache_capacity" = 10240;

        # ## SPECULATIVE LOADING
        # "network.dns.disablePrefetchFromHTTPS" = true;
        # "network.dns.disablePrefetch" = true;
        # "network.predictor.enabled" = false;
        # "network.prefetch-next" = false;
        #
        # # SECUREFOX
        #
        # ## TRACKING PROTECTION
        # "browser.contentblocking.category" = "strict";
        # "browser.download.start_downloads_in_tmp_dir" = true;
        # "browser.helperApps.deleteTempFileOnExit" = true;
        # "browser.uitour.enabled" = false;
        # "privacy.globalprivacycontrol.enabled" = true;
        # "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
        # "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
        #
        # ## OCSP & CERTS / HPKP
        # "security.OCSP.enabled" = 0;
        # "security.pki.crlite_mode" = 2;
        # "security.remote_settings.crlite_filters.enabled" = true;
        #
        # ## SSL / TLS
        # "browser.xul.error_pages.expert_bad_cert" = true;
        # "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        # "security.tls.enable_0rtt_data" = false;
        #
        # ## FINGERPRINT PROTECTION & RESIST
        # "browser.startup.blankWindow" = false;
        # # "privacy.fingerprintingProtection" = true;
        # # "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
        #
        # ## DISK AVOIDANCE
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "browser.sessionstore.interval" = 60000;
        #
        # ## SHUTDOWN & SANITIZING
        # "privacy.history.custom" = true;
        # "browser.privatebrowsing.resetPBM.enabled" = true;
        # "privacy.sanitize.sanitizeOnShutdown" = true;
        #
        # ## SEARCH / URL BAR
        "browser.formfill.enable" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.groupLabels.enabled" = false;
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.urlbar.suggest.quickactions" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.trimHttps" = true;
        "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
        "browser.urlbar.update2.engineAliasRefresh" = true;
        "security.insecure_connection_text.enabled" = true;
        "security.insecure_connection_text.pbmode.enabled" = true;
        #
        # ## HTTPS-FIRST POLICY
        # "dom.security.https_first" = true;
        # "dom.security.https_first_pbm" = true;
        # "dom.security.https_first_schemeless" = true;
        #
        # ## HTTPS-ONLY MODE
        # "dom.security.https_only_mode" = true;
        #
        # ## PASSWORDS
        # "editor.truncate_user_pastes" = false;
        # "network.auth.subresource-http-auth-allow" = 1;
        # "signon.autofillForms.http" = false;
        # "signon.formlessCapture.enabled" = false;
        # "signon.generation.enabled" = false;
        # "signon.privateBrowsingCapture.enabled" = false;
        # "signon.rememberSignons" = false;
        # "signon.storeWhenAutocompleteOff" = false;
        #
        # ## ADDRESS + CREDIT CARD MANAGER
        # "extensions.formautofill.addresses.enabled" = false;
        # "extensions.formautofill.creditCards.enabled" = false;
        #
        # ## MIXED-CONTENT + CROSS-SITE
        # # "security.mixed_content.block_display_content" = true;
        # "pdfjs.enableScripting" = false;
        #
        # ## HEADERS / REFERERS
        # "network.http.referer.XOriginTrimmingPolicy" = 2;
        #
        # ## CONTAINERS
        # "privacy.userContext.enabled" = true;
        # "privacy.userContext.ui.enabled" = true;
        #
        # ## MOZILLA
        "browser.search.update" = false;
        "identity.fxaccounts.enabled" = false;
        "permissions.manager.defaultsUrl" = "";

        ## TELEMETRY
        # "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        # "browser.newtabpage.activity-stream.telemetry" = false;
        # "datareporting.healthreport.uploadEnabled" = false;
        # "datareporting.policy.dataSubmissionEnabled" = false;
        # "toolkit.coverage.endpoint.base" = "";
        # "toolkit.coverage.opt-out" = true;
        # "toolkit.telemetry.archive.enabled" = false;
        # "toolkit.telemetry.bhrPing.enabled" = false;
        # "toolkit.telemetry.enabled" = false;
        # "toolkit.telemetry.firstShutdownPing.enabled" = false;
        # "toolkit.telemetry.newProfilePing.enabled" = false;
        # "toolkit.telemetry.server" = "data:,";
        # "toolkit.telemetry.shutdownPingSender.enabled" = false;
        # "toolkit.telemetry.unified" = false;
        # "toolkit.telemetry.updatePing.enabled" = false;
        # "toolkit.telemetry.coverage.opt-out" = true;

        ## EXPERIMENTS
        "app.normandy.api_url" = "";
        "app.normandy.enabled" = false;
        "app.shield.optoutstudies.enabled" = false;

        ## CRASH REPORTS
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;

        ## DETECTION
        # "captivedetect.canonicalURL" = "";
        # "network.captive-portal-service.enabled" = false;

        # SMOOTHFOX

        ## NATURAL SMOOTH SCROLLING V3
        "apz.overscroll.enabled" = true;
        "general.smoothScroll" = true;
        "general.smoothScroll.currentVelocityWeighting" = 1;
        "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 12;
        "general.smoothScroll.msdPhysics.enabled" = true;
        "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 600;
        "general.smoothScroll.msdPhysics.regularSpringConstant" = 650;
        "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 25;
        "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = 2;
        "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 250;
        "general.smoothScroll.stopDecelerationWeighting" = 1;
        "mousewheel.default.delta_multiplier_y" = 250;

        # PESKYFOX

        ## MOZILLA UI
        "browser.aboutConfig.showWarning" = false;
        "browser.aboutwelcome.enabled" = false;
        "browser.discovery.enabled" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.preferences.moreFromMozilla" = false;
        "browser.privatebrowsing.vpnpromourl" = "";
        "browser.shell.checkDefaultBrowser" = false;
        "browser.startup.homepage" = "https://todo.lan.msviridov.com";
        "browser.tabs.inTitlebar" = 0;
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;

        ## FONTS
        "font.minimum-size.th" = 16;
        "font.size.variable.th" = 18;
        "font.size.fixed.th" = 15;
        "font.minimum-size.x-western" = 14;
        "font.size.variable.x-western" = 15;
        "font.size.fixed.x-western" = 13;

        ## THEME ADJUSTMENTS
        "browser.compactmode.show" = true;
        "browser.uidensity" = 1;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        # "layout.css.prefers-color-scheme.content-override" = 2;
        # "layout.css.devPixelsPerPx" = -1.0;
        # "layout.css.dpi" = -1;

        ## COOKIE BANNER HANDLING
        # "cookiebanners.service.mode" = 1;
        # "cookiebanners.service.mode.privateBrowsing" = 1;

        ## FULLSCREEN NOTICE
        # "full-screen-api.transition-duration.enter" = "0 0";
        # "full-screen-api.transition-duration.leave" = "0 0";
        # "full-screen-api.warning.delay" = -1;
        # "full-screen-api.warning.timeout" = 0;

        ## URL BAR
        # "browser.urlbar.suggest.engines" = false;
        # "browser.urlbar.suggest.calculator" = true;
        # "browser.urlbar.trending.featureGate" = false;
        # "browser.urlbar.unitConversion.enabled" = true;

        ## NEW TAB PAGE
        "browser.newtabpage.activity-stream.default.sites" = "";
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.showWeather" = false;

        ## POCKET
        # "extensions.pocket.enabled" = false;

        ## DOWNLOADS
        # "browser.download.manager.addToRecentDocs" = false;

        ## PDF
        # "browser.download.open_pdf_attachments_inline" = true;

        ## SIDEBAR
        # "sidebar.animation.duration-ms" = 100;
        # "sidebar.animation.enabled" = true;
        # "/idebar.expandOnHover" = false;
        # "sidebar.main.tools" = "";
        # "sidebar.revamp" = true;
        # "sidebar.revamp.round-content-area" = true;
        # "sidebar.verticalTabs" = true;
        # "sidebar.visibility" = "always-show";
      };
    };
  };
}
