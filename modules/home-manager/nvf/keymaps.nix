{...}: {
  programs.nvf = {
    settings.vim.keymaps = [
      {
        key = "<leader>ff";
        mode = "n";
        silent = true;
        action = ":lua Snacks.picker.files()<CR>";
        desc = "Find Files";
      }
      {
        key = "<leader>/";
        mode = "n";
        silent = true;
        action = ":lua Snacks.picker.grep()<CR>";
        desc = "grep";
      }
      {
        key = "<C-a>";
        mode = "i";
        silent = true;
        action = "<ESC>^i";
      }
      {
        key = "<C-e>";
        mode = "i";
        silent = true;
        action = "<End>";
      }
      {
        key = "<C-d>";
        mode = "n";
        silent = true;
        action = "<C-d>zz";
      }
      {
        key = "<C-u>";
        mode = "n";
        silent = true;
        action = "<C-u>zz";
      }
      {
        key = "K";
        mode = "v";
        silent = true;
        action = ":m '<-2<CR>gv=gv";
      }
      {
        key = "J";
        mode = "v";
        silent = true;
        action = ":m '>+1<CR>gv=gv";
      }
      {
        key = "<";
        mode = "v";
        silent = true;
        action = "<gv";
      }
      {
        key = ">";
        mode = "v";
        silent = true;
        action = ">gv";
      }
    ];
  };
}
