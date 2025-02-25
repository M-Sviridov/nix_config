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
      };

      DisableFirefoxAccounts = true;
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

    profiles.framework13 = {
      id = 0;

      containers."Le Club" = {
        color = "turquoise";
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
          "Google".metaData.hidden = true;
          "Wikipedia (en)".metaData.hidden = true;
        };

        force = true;
        order = ["DuckDuckGo"];
        privateDefault = "DuckDuckGo";
      };

      settings = {
        # FASTFOX

        ## GENERAL
        "content.notify.interval" = 100000;

        ## GFX & MEDIA
        "gfx.canvas.accelerated.cache-items" = 4096;
        "gfx.canvas.accelerated.cache-size" = 512;
        "gfx.content.skia-font-cache-size" = 20;
        "gfx.webrender.all" = true;
        "gfx.webrender.compositor" = true;
        "gfx.webrender.compositor.force-enabled" = true;
        "media.eme.enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;

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

        ## SPECULATIVE LOADING
        "network.dns.disablePrefetchFromHTTPS" = true;
        "network.dns.disablePrefetch" = true;
        "network.predictor.enabled" = false;
        "network.prefetch-next" = false;

        # SECUREFOX

        ## TRACKING PROTECTION
        "browser.contentblocking.category" = "strict";
        "browser.download.start_downloads_in_tmp_dir" = true;
        "browser.helperApps.deleteTempFileOnExit" = true;
        "browser.uitour.enabled" = false;
        "privacy.globalprivacycontrol.enabled" = true;
        "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
        "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";

        ## OCSP & CERTS / HPKP
        "security.OCSP.enabled" = 0;
        "security.pki.crlite_mode" = 2;
        "security.remote_settings.crlite_filters.enabled" = true;

        ## SSL / TLS
        "browser.xul.error_pages.expert_bad_cert" = true;
        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "security.tls.enable_0rtt_data" = false;

        ## FINGERPRINT PROTECTION & RESIST
        "browser.startup.blankWindow" = false;
        "privacy.fingerprintingProtection" = true;
        "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";

        ## DISK AVOIDANCE
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "browser.sessionstore.interval" = 60000;

        ## SHUTDOWN & SANITIZING
        "privacy.history.custom" = true;
        "browser.privatebrowsing.resetPBM.enabled" = true;
        "privacy.sanitize.sanitizeOnShutdown" = true;

        ## SEARCH / URL BAR
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

        ## HTTPS-FIRST POLICY
        "dom.security.https_first" = true;
        "dom.security.https_first_pbm" = true;
        "dom.security.https_first_schemeless" = true;

        ## HTTPS-ONLY MODE
        "dom.security.https_only_mode" = true;

        ## PASSWORDS
        "editor.truncate_user_pastes" = false;
        "network.auth.subresource-http-auth-allow" = 1;
        "signon.autofillForms.http" = false;
        "signon.formlessCapture.enabled" = false;
        "signon.generation.enabled" = false;
        "signon.privateBrowsingCapture.enabled" = false;
        "signon.rememberSignons" = false;
        "signon.storeWhenAutocompleteOff" = false;

        ## ADDRESS + CREDIT CARD MANAGER
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;

        ## MIXED-CONTENT + CROSS-SITE
        "security.mixed_content.block_display_content" = true;
        "pdfjs.enableScripting" = false;

        ## HEADERS / REFERERS
        "network.http.referer.XOriginTrimmingPolicy" = 2;

        ## CONTAINERS
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;

        ## MOZILLA
        "browser.search.update" = false;
        "identity.fxaccounts.enabled" = false;
        "permissions.manager.defaultsUrl" = "";

        ## TELEMETRY
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "toolkit.coverage.endpoint.base" = "";
        "toolkit.coverage.opt-out" = true;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;

        ## EXPERIMENTS
        "app.normandy.api_url" = "";
        "app.normandy.enabled" = false;
        "app.shield.optoutstudies.enabled" = false;

        ## CRASH REPORTS
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;

        ## DETECTION
        "captivedetect.canonicalURL" = "";
        "network.captive-portal-service.enabled" = false;

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
        "browser.tabs.inTitlebar" = 0;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.preferences.moreFromMozilla" = false;
        "browser.privatebrowsing.vpnpromourl" = "";
        "browser.startup.homepage" = "https://todo.lan.msviridov.com";
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;

        ## FONTS
        "font.minimum-size.th" = 18;
        "font.size.variable.th" = 18;
        "font.minimum-size.x-western" = 16;
        "font.size.variable.x-western" = 16;

        ## THEME ADJUSTMENTS
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layout.css.prefers-color-scheme.content-override" = 2;
        "layout.css.devPixelsPerPx" = 1.7;

        ## COOKIE BANNER HANDLING
        "cookiebanners.service.mode" = 1;
        "cookiebanners.service.mode.privateBrowsing" = 1;

        ## FULLSCREEN NOTICE
        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.delay" = -1;
        "full-screen-api.warning.timeout" = 0;

        ## URL BAR
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.calculator" = true;
        "browser.urlbar.trending.featureGate" = false;
        "browser.urlbar.unitConversion.enabled" = true;

        ## NEW TAB PAGE
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.showWeather" = true;

        ## POCKET
        "extensions.pocket.enabled" = false;

        ## DOWNLOADS
        "browser.download.manager.addToRecentDocs" = false;

        ## PDF
        "browser.download.open_pdf_attachments_inline" = true;

        ## TAB BEHAVIOR
        "browser.bookmarks.openInTabClosesMenu" = false;
        "browser.menu.showViewImageInfo" = true;
        "findbar.highlightAll" = true;
        "layout.word_select.eat_space_to_next_word" = false;
      };
    };
  };
}
