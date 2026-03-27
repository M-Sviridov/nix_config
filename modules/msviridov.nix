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
        wezterm
      ]
      ++ [
        den.provides.define-user
        den.provides.hostname
        den.provides.primary-user
        (den.provides.user-shell "fish")
      ];

    homeManager = {pkgs, ...}: {
      home.packages = [];
    };

    # user can provide NixOS configurations
    # to any host it is included on
    # nixos = { pkgs, ... }: { };
  };
}
