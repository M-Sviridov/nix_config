{
  inputs,
  pkgs,
  ...
}: {
  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      withUWSM = true;
    };

    uwsm = {
      waylandCompositors = {
        hyprland = {
          prettyName = "Hyprland";
          comment = "Hyprland compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/Hyprland";
        };
      };
    };
  };

  environment = {
    variables = {
      NIXOS_OZONE_WL = "1";
      HYPRCURSOR_THEME = "rose-pine-hyprcursor";
      HYPRCURSOR_SIZE = 24;
      XCURSOR_THEME = "BreezeX-RosePine";
      XCURSOR_SIZE = 24;
    };
  };
}
