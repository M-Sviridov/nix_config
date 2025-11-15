{...}: {
  programs.nixvim = {
    lsp = {
      inlayHints.enable = true;

      servers = {
        ansiblels.enable = true;
        bashls.enable = true;
        docker_language_server.enable = true;

        gopls = {
          enable = true;
          config = {
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true;
                };

                completeUnimported = true;
                gofumpt = true;
                usePlaceholders = true;

                "ui.inlayhint.hints" = {
                  assignVariableTypes = true;
                  compositeLiteralFields = true;
                  compositeLiteralTypes = true;
                  constantValues = true;
                  functionTypeParameters = true;
                  parameterNames = true;
                  rangeVariableTypes = true;
                };
              };
            };
          };
        };

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
