{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    prettier
  ];

  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = true;

    settings = {
      formatters_by_ft = {
        bash = ["beautysh"];
        markdown = ["prettier"];
        nix = ["alejandra"];
        sh = ["beautysh"];
        terraform = ["tofu_fmt"];
        tofu = ["tofu_fmt"];
        yaml = ["prettier"];
      };

      format_on_save = {
        timeout = 2500;
        lsp_format = "fallback";
      };
    };
  };
}
