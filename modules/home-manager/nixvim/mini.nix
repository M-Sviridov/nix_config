{...}: {
  programs.nixvim.plugins.mini = {
    enable = true;

    modules = {
      icons = {
        style = "glyph";
        default = {};
        directory = {};
        extension = {};
        file = {};
        filetype = {};
        lsp = {};
        os = {};
      };
    };

    mockDevIcons = true;
  };
}
