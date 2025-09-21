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
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      ];
    };
  };
}
