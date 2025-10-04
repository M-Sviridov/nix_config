{...}: {
  programs.nixvim.plugins = {
    dropbar = {
      enable = true;
      settings.icons.enable = true;
    };

    fidget = {
      enable = true;
      settings.notification.window.winblend = 0;
    };

    friendly-snippets.enable = true;

    gitsigns = {
      enable = true;

      settings = {
        current_line_blame = true;
      };
    };

    hardtime.enable = true;
    lz-n.enable = true;
    nvim-autopairs.enable = true;
    nvim-surround.enable = true;
    rainbow-delimiters.enable = true;
    tiny-devicons-auto-colors.enable = true;
  };
}
