{
  my.nix.nixos = {
    optimise.automatic = true;

    settings = {
      auto-optimise-store = true;
      download-buffer-size = 524288000;
    };
  };
}
