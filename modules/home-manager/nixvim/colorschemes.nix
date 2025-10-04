{...}: {
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      float = {
        transparent = true;
        solid = false;
      };

      integrations = {
        blink_cmp = true;

        dropbar = {
          enabled = true;
          color_mode = true;
        };

        fidget = true;
        flash = true;

        gitsigns = {
          enabled = true;
          transparent = true;
        };

        native_lsp.enabled = true;
        noice = true;
        notify = true;
        nvim_surround = true;
        rainbow-delimiters = true;

        snacks = {
          enabled = true;
          indent_scope_color = "";
        };

        treesitter_context = true;
        which_key = true;
      };
    };
  };
}
