{...}: {
  programs.nixvim.plugins.tiny-inline-diagnostic = {
    enable = true;

    settings = {
      multilines.enabled = true;
      options.use_icons_from_diagnostic = true;
      preset = "modern";
    };
  };
}
