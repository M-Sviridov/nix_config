{...}: {
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = true;

    settings = {
      formatters_by_ft = {
        markdown = ["prettier"];
        nix = ["alejandra"];
      };

      format_on_save = {
        timeout = 2500;
        lsp_format = "fallback";
      };
    };
  };
}
