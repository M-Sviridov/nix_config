{...}: {
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        hideSearchHighlight = true;
        options = {
          cursorlineopt = "line";
          mouse = "a";
          shiftwidth = 2;
          tabstop = 2;
          updatetime = 50;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };

        scrollOffset = 10;
        searchCase = "smart";
        useSystemClipboard = true;
        viAlias = true;
        vimAlias = true;

        autocomplete.blink-cmp.enable = true;
        formatter.conform-nvim.enable = true;
        mini.statusline.enable = true;
        telescope.enable = true;
        ui.noice.enable = true;

        languages = {
          enableExtraDiagnostics = true;
          enableFormat = true;
          enableLSP = true;
          enableTreesitter = true;

          bash.enable = true;
          lua.enable = true;
          markdown.enable = true;
          nix.enable = true;
        };
      };
    };
  };
}
