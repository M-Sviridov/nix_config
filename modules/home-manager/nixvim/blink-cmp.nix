{...}: {
  programs.nixvim.plugins.blink-cmp = {
    enable = true;

    settings = {
      appearance = {
        nerd_font_variant = "mono";
        kind_icons = {
          Text = "";
          Method = "";
          Function = "";
          Constructor = "";
          Field = "";
          Variable = "";
          Class = "";
          Interface = "";
          Module = "";
          Property = "";
          Unit = "";
          Value = "";
          Enum = "";
          Keyword = "";
          Snippet = "";
          Color = "";
          File = "";
          Reference = "";
          Folder = "";
          EnumMember = "";
          Constant = "";
          Struct = "";
          Event = "";
          Operator = "";
          TypeParameter = "";
        };
      };

      completion = {
        documentation.auto_show = false;
        accept.auto_brackets.enabled = false;
      };

      fuzzy.implementation = "prefer_rust_with_warning";
      keymap.preset = "default";
      sources.default = ["lsp" "path" "snippets" "buffer"];
    };
  };
}
