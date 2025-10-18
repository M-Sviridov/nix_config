{...}: {
  programs.zen-browser = {
    policies = {
      Bookmarks = [
        # ENTERTAINMENT
        {
          Title = "Jellyfin";
          URL = "https://jellyfin.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Entertainment";
        }
        {
          Title = "Jellyseerr";
          URL = "https://jellyseerr.msviridov.com";
          Placement = "toolbar";
          Folder = "Entertainment";
        }
        {
          Title = "Reddit";
          URL = "https://reddit.com";
          Placement = "toolbar";
          Folder = "Entertainment";
        }
        {
          Title = "YouTube";
          URL = "https://youtube.com";
          Placement = "toolbar";
          Folder = "Entertainment";
        }

        # HOMELAB
        {
          Title = "AdGuard Home";
          URL = "https://adguard.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Coder";
          URL = "https://coder.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Dozzle";
          URL = "https://dozzle.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "FreshRSS";
          URL = "https://rss.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Frigate";
          URL = "https://frigate.lan.leclubavon.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "HAOS";
          URL = "https://haos.lan.leclubavon.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Heimdall";
          URL = "https://heimdall.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Immich";
          URL = "https://immich.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Ntfy";
          URL = "https://ntfy.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Open WebUI";
          URL = "https://openwebui.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "OPNsense";
          URL = "https://opnsense.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "qBittorrent";
          URL = "https://qbit.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Radarr";
          URL = "https://radarr.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Radarr Anime";
          URL = "https://radarr-anime.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Sonarr";
          URL = "https://sonarr.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Sonarr Anime";
          URL = "https://sonarr-anime.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "Speedtest";
          URL = "https://speedtest.lan.msviridov.com";
          Placement = "toolbar";
          Folder = "Homelab";
        }
        {
          Title = "UniFi Site Manager";
          URL = "https://unifi.ui.com/";
          Placement = "toolbar";
          Folder = "Homelab";
        }

        # PERSO
        {
          Title = "Coros Training Hub";
          URL = "https://t.coros.com/admin/views/dash-board";
          Placement = "toolbar";
          Folder = "Perso";
        }
        {
          Title = "Proton Mail";
          URL = "https://mail.proton.me";
          Placement = "toolbar";
          Folder = "Perso";
        }
        {
          Title = "Proton Pass";
          URL = "https://proton.me/pass";
          Placement = "toolbar";
          Folder = "Perso";
        }
        {
          Title = "Tailscale";
          URL = "https://login.tailscale.com/admin/machines";
          Placement = "toolbar";
          Folder = "Perso";
        }
        {
          Title = "VaultWarden";
          URL = "https://vault.msviridov.com";
          Placement = "toolbar";
          Folder = "Perso";
        }

        # PRO
        {
          Title = "Gmail";
          URL = "https://mail.google.com";
          Placement = "toolbar";
          Folder = "Pro";
        }
        {
          Title = "Google Calendar";
          URL = "https://calendar.google.com";
          Placement = "toolbar";
          Folder = "Pro";
        }
      ];
    };
  };
}
