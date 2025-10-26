{...}: {
  nix = {
    optimise.automatic = true;

    settings = {
      download-buffer-size = 524288000;

      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
