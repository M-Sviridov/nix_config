{pkgs, ...}: {
  programs.zen-browser = {
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
          "https://freshrss.msviridov.com/"
          "https://github.com/"
          "https://google.com/"
          "https://jellyfin.lan.msviridov.com/"
          "https://jellyseerr.msviridov.com/"
          "https://mistral.ai/"
          "https://ntfy.lan.msviridov.com/"
          "https://proton.me/"
          "https://redditcom/"
          "https://soundcloud.com/"
          "https://t.coros.com/admin/views/dash-board"
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

    profiles.msviridov = {
      id = 0;

      containers = {
        "Admin" = {
          color = "red";
          icon = "fingerprint";
          id = 1;
        };

        "Personal" = {
          color = "green";
          icon = "circle";
          id = 2;
        };

        "Work" = {
          color = "blue";
          icon = "briefcase";
          id = 3;
        };
      };

      containersForce = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        catppuccin-web-file-icons
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
        "browser.preferences.defaultPerformanceSettings.enabled" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        ## NETWORK
        "network.dnsCacheEntries" = 10000;
        "network.dnsCacheExpiration" = 600;
        "network.dnsCacheExpirationGracePeriod" = 120;
        "network.http.max-connections" = 1200;
        "network.http.max-persistent-connections-per-server" = 8;
        "network.http.max-urgent-start-excessive-connections-per-host" = 5;
        "network.http.pacing.requests.burst" = 32;
        "network.http.pacing.requests.enabled" = false;
        "network.http.pacing.requests.min-parallelism" = 10;
        "network.http.request.max-start-delay" = 5;
        "network.ssl_tokens_cache_capacity" = 32768;

        ## SPECULATIVE LOADING
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.places.speculativeConnect.enabled" = false;
        "network.dns.disablePrefetchFromHTTPS" = true;
        "network.dns.disablePrefetch" = true;
        "network.http.speculative-parallel-limit" = 0;
        "network.predictor.enabled" = false;
        "network.prefetch-next" = false;

        ## MEMORY & CACHING
        "javascript.options.mem.high_water_mark" = 128;
        "browser.cache.disk.enable" = false;
        "browser.cache.disk.capacity" = 0;
        "browser.cache.disk.smart_size.enabled" = false;
        "browser.cache.disk.metadata_memory_limit" = 16384;
        "browser.cache.max_shutdown_io_lag" = 100;
        "browser.cache.memory.max_entry_size" = 32768;
        "browser.cache.memory.capacity" = 131072;
        "browser.cache.memory.enable" = true;
        "image.mem.max_decoded_image_kb" = 512000;
        "image.cache.size" = 10485760;
        "image.mem.decode_bytes_at_a_time" = 65536;
        "image.mem.shared.unmap.min_expiration_ms" = 90000;
        "media.memory_cache_max_size" = 1048576;
        "media.memory_caches_combined_limit_kb" = 4194304;
        "media.cache_readahead_limit" = 600;
        "media.cache_resume_threshold" = 300;
        "dom.storage.default_quota" = 20480;
        "dom.storage.shadow_writes" = true;
        "browser.sessionstore.interval" = 60000;
        "browser.sessionhistory.max_total_viewers" = 10;
        "browser.sessionstore.max_tabs_undo" = 10;
        "browser.sessionstore.max_entries" = 10;
        "browser.tabs.min_inactive_duration_before_unload" = 600000;

        ## JAVASCRIPTS & CONTENT
        "content.maxtextrun" = 8191;
        "content.interrupt.parsing" = true;
        "content.notify.ontimer" = true;
        "content.notify.interval" = 50000;
        "content.max.tokenizing.time" = 2000000;
        "content.switch.threshold" = 300000;
        "layout.frame_rate" = -1;
        "nglayout.initialpaint.delay" = 5;
        "gfx.content.skia-font-cache-size" = 32;

        ## GPU & RENDERING
        "gfx.webrender.all" = true;
        "gfx.webrender.enabled" = true;
        "gfx.webrender.compositor" = true;
        "gfx.webrender.precache-shaders" = true;
        "gfx.webrender.software" = false;
        "gfx.canvas.accelerated.cache-items" = 32768;
        "gfx.canvas.accelerated.cache-size" = 4096;
        "gfx.canvas.max-size" = 16384;
        "webgl.max-size" = 16384;
        "dom.webgpu.enabled" = true;

        ## UI RESPONSIVENESS
        "ui.submenuDelay" = 0;
        "dom.element.animate.enabled" = true;
        "general.smoothScroll" = true;
        "general.smoothScroll.msdPhysics.enabled" = false;
        "general.smoothScroll.currentVelocityWeighting" = 0;
        "apz.overscroll.enabled" = false;
        "general.smoothScroll.stopDecelerationWeighting" = 1;
        "general.smoothScroll.mouseWheel.durationMaxMS" = 150;
        "general.smoothScroll.mouseWheel.durationMinMS" = 50;
        "mousewheel.min_line_scroll_amount" = 15;
        "mousewheel.scroll_series_timeout" = 10;

        ## PROCESSES & TABS
        "dom.ipc.processCount" = 8;
        "dom.ipc.keepProcessesAlive.web" = 4;
        "accessibility.force_disabled" = 1;

        ## MEDIA & CODECS
        "dom.media.webcodecs.h265.enabled" = true;
        "media.videocontrols.picture-in-picture.enable-when-switching-tabs.enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.hardware-video-decoding.force-enabled" = true;

        ## SECURITY & PRIVACY
        "privacy.query_stripping.enabled" = true;
        "network.http.referer.XOriginPolicy" = 0;
        "network.http.referer.XOriginTrimmingPolicy" = 0;
        "privacy.partition.network_state" = false;

        ## TAB PAGE
        "browser.newtabpage.activity-stream.default.sites" = "";
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.showWeather" = false;

        ## LINUX SPECIFIC
        "widget.wayland.opaque-region.enabled" = true;
        "widget.wayland.fractional-scale.enabled" = true;

        ## ZEN SPECIFIC & AI TOOLS
        "reader.parse-on-load.enabled" = false;
        "browser.ml.chat.enabled" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.findbar.suggest.enabled" = false;
      };
    };
  };
}
