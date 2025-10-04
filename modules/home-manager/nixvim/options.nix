{...}: {
  programs.nixvim = {
    clipboard.register = "unnamedplus";

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
      showmode = false;
      undofile = true;
      scrolloff = 10;
      shiftwidth = 2;
      number = true;
      list = true;
      tabstop = 2;
      mouse = "a";
      expandtab = true;
    };
  };
}
