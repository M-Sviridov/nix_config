{...}: {
  programs.nixvim = {
    lsp = {
      inlayHints.enable = true;

      servers = {
        ansiblels.enable = true;
        bashls.enable = true;
        docker_language_server.enable = true;
        gopls.enable = true;
        lua_ls.enable = true;
        markdown_oxide.enable = true;
        nixd.enable = true;
        terraformls.enable = true;
        yamlls.enable = true;
      };
    };

    plugins.lspconfig.enable = true;
  };
}
