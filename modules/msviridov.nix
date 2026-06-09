{
  den,
  my,
  ...
}: {
  # user aspect
  den.aspects.msviridov = {
    includes = with my;
      [
        catppuccin
        fonts
        gaming
        ghostty
        git
        gtk
        keyd-remapper
        logitech
        niri
        nixvim
        nix
        programs
        ssh
        starship
        tmux
        zen-browser
        zsh
      ]
      ++ [
        den.provides.define-user
        den.provides.hostname
        den.provides.primary-user
        (den.provides.user-shell "zsh")
      ];

    homeManager = {pkgs, ...}: {
      nixpkgs = {
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "electron-39.8.10"
            "ventoy-1.1.12"
          ];
        };
      };

      home.packages = with pkgs; [
        anki
        ansible
        awscli2
        bitwarden-desktop
        czkawka
        dnsutils
        doggo
        ente-auth
        evince
        feishin
        ffmpeg-full
        fragments
        gnome-calendar
        jq
        libreoffice
        loupe
        nmap
        obsidian
        opentofu
        plezy
        proton-vpn
        signal-desktop
        traceroute
        usbutils
        ventoy
      ];

      xdg = {
        mimeApps = {
          enable = true;
          defaultApplications = {
            # --- File Manager ---
            "inode/directory" = "org.gnome.Nautilus.desktop";

            # --- Web / URLs ---
            "x-scheme-handler/http" = "zen-twilight.desktop";
            "x-scheme-handler/https" = "zen-twilight.desktop";
            "x-scheme-handler/ftp" = "zen-twilight.desktop";
            "x-scheme-handler/chrome" = "zen-twilight.desktop";
            "text/html" = "zen-twilight.desktop";
            "application/xhtml+xml" = "zen-twilight.desktop";

            # --- Email ---
            # "x-scheme-handler/mailto" = "thunderbird.desktop";
            # "message/rfc822" = "thunderbird.desktop";

            # --- PDF / Documents ---
            "application/pdf" = "org.pwmt.zathura.desktop";
            "application/epub+zip" = "org.pwmt.zathura.desktop";
            "application/x-cbz" = "org.pwmt.zathura.desktop";

            # --- Office Documents ---
            "application/msword" = "writer.desktop";
            "application/vnd.oasis.opendocument.text" = "writer.desktop";
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
            "application/vnd.ms-excel" = "calc.desktop";
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "calc.desktop";
            "application/vnd.ms-powerpoint" = "impress.desktop";
            "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "impress.desktop";

            # --- Images ---
            "image/jpeg" = "imv-dir.desktop";
            "image/png" = "imv-dir.desktop";
            "image/gif" = "imv-dir.desktop";
            "image/webp" = "imv-dir.desktop";
            "image/svg+xml" = "imv-dir.desktop";
            "image/tiff" = "imv-dir.desktop";
            "image/bmp" = "imv-dir.desktop";
            "image/avif" = "imv-dir.desktop";

            # --- Video ---
            "video/mp4" = "mpv.desktop";
            "video/webm" = "mpv.desktop";
            "video/x-matroska" = "mpv.desktop";
            "video/quicktime" = "mpv.desktop";
            "video/x-msvideo" = "mpv.desktop";
            "video/mpeg" = "mpv.desktop";
            "video/ogg" = "mpv.desktop";

            # --- Torrents ---
            "application/x-bittorrent" = "fragments.desktop";
            "x-scheme-handler/magnet" = "fragments.desktop";

            # --- Calendar / Contacts ---
            # "text/calendar" = "thunderbird.desktop"; # or gnome-calendar
            # "text/x-vcard" = "thunderbird.desktop";

            # --- Misc Scheme Handlers ---
            "x-scheme-handler/about" = "zen-twilight.desktop";
            "x-scheme-handler/unknown" = "zen-twilight.desktop";
            "x-scheme-handler/terminal" = "com.mitchellh.ghostty.desktop";
          };
        };
      };
    };

    # user can provide NixOS configurations
    # to any host it is included on
    nixos = {
      services = {
        tailscale = {
          enable = true;
          extraUpFlags = [
            "--accept-dns"
            "--accept-routes"
          ];
        };
      };
    };

    security.sudo.extraRules = [
      {
        users = ["msviridov"];
        commands = [
          {
            command = "/run/current-system/sw/bin/systemctl stop keyd";
            options = ["NOPASSWD"];
          }
          {
            command = "/run/current-system/sw/bin/systemctl start keyd";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
  };
}
