{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ghostscript
    mermaid-cli
    tectonic
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        autocomplete = {
          blink-cmp = {
            enable = true;
            friendly-snippets.enable = true;
            mappings = {
              confirm = "<C-y>";
              next = "<C-n>";
              previous = "<C-p>";
            };
          };
        };

        autopairs.nvim-autopairs.enable = true;
        binds.whichKey.enable = true;
        diagnostics.nvim-lint.enable = true;
        formatter.conform-nvim.enable = true;

        languages = {
          enableTreesitter = true;

          bash.enable = true;
          css.enable = true;
          lua.enable = true;
          markdown.enable = true;
          nix.enable = true;
          yaml.enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          lspconfig.enable = true;
          trouble.enable = true;
        };

        globals = {
          maplocalleader = " ";
          mapleader = " ";
        };

        options = {
          autoindent = true;
          breakindent = true;
          completeopt = "menu,menuone,noinsert";
          conceallevel = 1;
          cursorline = true;
          inccommand = "split";
          ignorecase = true;
          list = true;
          number = true;
          relativenumber = true;
          scrolloff = 10;
          showmode = false;
          smartcase = true;
          smartindent = true;
          splitbelow = true;
          splitright = true;
          shiftwidth = 2;
          tabstop = 2;
          undofile = true;
          updatetime = 250;
        };

        mini.statusline.enable = true;

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };

        ui = {
          breadcrumbs = {
            enable = true;
            navbuddy.enable = true;
          };

          noice.enable = true;
        };

        utility = {
          motion = {
            flash-nvim.enable = true;
          };

          sleuth.enable = true;

          snacks-nvim = {
            enable = true;

            setupOpts = {
              bigfile = {
                enabled = true;
              };
              indent = {
                enabled = true;
              };
              input = {
                enabled = true;
              };
              picker = {
                enabled = true;
                db = {
                  sqlite3_path = "${pkgs.sqlite.out}/lib/libsqlite3.so";
                };
              };
              notifier = {
                enabled = true;
              };
              quickfile = {
                enabled = true;
              };
              scope = {
                enabled = true;
              };
              statuscolumn = {
                enabled = true;
              };
              words = {
                enabled = true;
              };
            };
          };
        };

        visuals = {
          nvim-web-devicons.enable = true;
          rainbow-delimiters.enable = true;
          tiny-devicons-auto-colors.enable = true;
        };

        viAlias = true;
        vimAlias = true;
      };
    };
  };
}
