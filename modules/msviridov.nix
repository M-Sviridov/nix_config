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
      nixpkgs.config.allowUnfree = true;

      home.packages = with pkgs; [
        anki
        ansible
        bitwarden-desktop
        ente-auth
        jq
        logseq
        loupe
        obsidian
        plezy
        proton-vpn
        signal-desktop
      ];

      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "inode/directory" = "org.gnome.Nautilus.desktop";
          "x-scheme-handler/file" = "org.gnome.Nautilus.desktop";
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
