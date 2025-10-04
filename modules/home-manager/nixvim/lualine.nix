{...}: {
  programs.nixvim.plugins.lualine = {
    enable = true;

    settings = {
      options = {
        component_separators = {
          left = "";
          right = "";
        };

        section_separators = {
          left = "";
          right = "";
        };

        theme = "catppuccin";
      };

      sections = {
        lualine_a = ["mode"];
        lualine_b = ["branch"];

        lualine_c = [
          "filename"
          "diagnostics"
        ];

        lualine_x = ["filetype"];
        lualine_y = ["progress"];
        lualine_z = ["location"];
      };
    };
  };
}
