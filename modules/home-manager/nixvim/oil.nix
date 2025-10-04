{...}: {
  programs.nixvim.plugins.oil = {
    enable = true;

    settings = {
      default_file_explorer = true;
      skip_confirm_for_simple_edits = true;

      view_options = {
        natural_order = true;
        show_hidden = true;
      };
    };
  };
}
