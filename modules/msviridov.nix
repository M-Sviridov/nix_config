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
        ghostty
        git
        gtk
        keyd-remapper
        niri
        programs
        ssh
        starship
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
      home.packages = [
        pkgs.bitwarden-desktop
      ];
    };

    # user can provide NixOS configurations
    # to any host it is included on
    # nixos = { pkgs, ... }: { };
  };
}
