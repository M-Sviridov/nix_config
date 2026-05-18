{
  my.nixvim.homeManager = {
    programs.nixvim = {
      clipboard.register = "unnamedplus";

      filetype = {
        extension.yml = "yaml.ansible";
        pattern = {
          "compose.*%.ya?ml" = "yaml.docker-compose";
          "docker%-compose.*%.ya?ml" = "yaml.docker-compose";
        };
      };

      globals = {
        have_nerd_font = true;
        maplocalleader = " ";
        mapleader = " ";
      };

      opts = {
        listchars = {
          tab = "» ";
          trail = "·";
          nbsp = "␣";
        };
        completeopt = "menu,menuone,noinsert";
        relativenumber = true;
        inccommand = "split";
        breakindent = true;
        smartindent = true;
        signcolumn = "yes";
        cursorline = true;
        splitbelow = true;
        splitright = true;
        ignorecase = true;
        conceallevel = 1;
        updatetime = 250;
        smartcase = true;
        smarttab = true;
        showmode = false;
        undofile = true;
        scrolloff = 10;
        number = true;
        list = true;
        mouse = "a";
        expandtab = true;
      };
    };
  };
}
