{...}: {
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      settings = {
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };
      };
    };

    treesitter-context = {
      enable = true;

      settings = {
        line_numbers = true;
        max_lines = 0;
        min_window_height = 0;
        mode = "cursor";
        multiline_threshold = 20;
        trim_scope = "outer";
        zindex = 20;
      };
    };
  };
}
