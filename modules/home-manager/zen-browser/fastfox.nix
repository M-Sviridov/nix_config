{...}: {
  programs.zen-browser.profiles."default".settings = {
    ## GENERAL  ##
    "gfx.content.skia-font-cache-size" = 32;

    ## GFX ##
    "gfx.webrender.layer-compositor" = true;
    "gfx.canvas.accelerated.cache-items" = 32768;
    "gfx.canvas.accelerated.cache-size" = 4096;
    "webgl.max-size" = 16384;

    ## DISK CACHE ##
    "browser.cache.disk.enable" = false;

    ## MEMORY CACHE ##
    "browser.cache.memory.capacity" = 131072;
    "browser.cache.memory.max_entry_size" = 20480;
    "browser.sessionhistory.max_total_viewers" = 4;
    "browser.sessionstore.max_tabs_undo" = 10;

    ## MEDIA CACHE ##
    "media.memory_cache_max_size" = 262144;
    "media.memory_caches_combined_limit_kb" = 1048576;
    "media.cache_readahead_limit" = 600;
    "media.cache_resume_threshold" = 300;

    ## IMAGE CACHE ##
    "image.cache.size" = 10485760;
    "image.mem.decode_bytes_at_a_time" = 65536;

    ## NETWORK ##
    "network.http.max-connections" = 1800;
    "network.http.max-persistent-connections-per-server" = 10;
    "network.http.max-urgent-start-excessive-connections-per-host" = 5;
    "network.http.request.max-start-delay" = 5;
    "network.http.pacing.requests.enabled" = false;
    "network.dnsCacheEntries" = 10000;
    "network.dnsCacheExpiration" = 3600;
    "network.ssl_tokens_cache_capacity" = 10240;

    ## SPECULATIVE LOADING ##
    "network.http.speculative-parallel-limit" = 0;
    "network.dns.disablePrefetch" = true;
    "network.dns.disablePrefetchFromHTTPS" = true;
    "browser.urlbar.speculativeConnect.enabled" = false;
    "browser.places.speculativeConnect.enabled" = false;
    "network.predictor.enabled" = false;
    "network.prefetch-next" = false;
  };
}
