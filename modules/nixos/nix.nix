{...}: {
  nix = {
    optimise.automatic = true;

    settings = {
      auto-optimise-store = true;
      download-buffer-size = 524288000;

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      substituters = [
        "https://hyprland.cachix.org"
        "https://vicinae.cachix.org"
        "https://install.determinate.systems"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
        "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
      ];
    };
  };
}
