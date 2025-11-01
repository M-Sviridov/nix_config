{...}: {
  programs.nixvim.plugins.tiny-inline-diagnostic = {
    enable = true;

    settings = {
      multilines.enabled = true;

      options = {
        use_icons_from_diagnostic = true;
        set_arrow_to_diag_color = true;
        show_source.enabled = false;
      };

      preset = "modern";
    };
  };
}
