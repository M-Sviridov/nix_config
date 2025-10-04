{...}: {
  programs.nixvim = {
    keymaps = [
      {
        action = "<CMD>lua Snacks.picker.smart()<CR>";
        key = "<leader><space>";
        options = {
          desc = "Smart Find Files";
          silent = true;
        };
      }
      {
        action = "<CMD>lua Snacks.picker.grep()<CR>";
        key = "<leader>/";
        options = {
          desc = "Grep";
          silent = true;
        };
      }
      {
        action = "<CMD>lua Snacks.picker.command_history()<CR>";
        key = "<leader>:";
        options = {
          desc = "Command History";
          silent = true;
        };
      }
      {
        action = "<CMD>lua Snacks.picker.notifications()<CR>";
        key = "<leader>n";
        options = {
          desc = "Notifications History";
          silent = true;
        };
      }
      {
        action = "<CMD>lua Snacks.picker.buffers()<CR>";
        key = "<leader>fb";
        options = {
          desc = "Find Buffers";
          silent = true;
        };
      }
      {
        action = "<CMD>lua Snacks.picker.files()<CR>";
        key = "<leader>ff";
        options = {
          desc = "Find Files";
          silent = true;
        };
      }
      {
        action = "<CMD>lua require('oil').toggle_float()<CR>";
        key = "<C-f>";
        options = {
          desc = "Toggle Oil Float";
          silent = true;
        };
      }
      {
        action = "nzzzv";
        key = "n";
        options.silent = true;
      }
      {
        action = "Nzzzv";
        key = "N";
        options.silent = true;
      }
      {
        action = "<C-d>zz";
        key = "<C-d>";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<C-u>zz";
        key = "<C-u>";
        mode = "n";
        options.silent = true;
      }
      {
        action = ":m '<-2<CR>gv=gv";
        key = "K";
        mode = "v";
        options.silent = true;
      }
      {
        action = ":m '>+1<CR>gv=gv";
        key = "J";
        mode = "v";
        options.silent = true;
      }
      {
        action = "<gv";
        key = "<";
        mode = "v";
        options.silent = true;
      }
      {
        action = ">gv";
        key = ">";
        mode = "v";
        options.silent = true;
      }
      {
        action = "<CMD>!chmod +x %<CR>";
        key = "<leader>cx";
        mode = "n";
        options = {
          desc = "Change File to Executable";
          silent = true;
        };
      }
      {
        action = "<CMD>vsplit<CR>";
        key = "<leader>sv";
        mode = "n";
        options = {
          desc = "Split Window Vertically";
          silent = true;
        };
      }
      {
        action = "<CMD>split<CR>";
        key = "<leader>sh";
        mode = "n";
        options = {
          desc = "Split Window Horizontally";
          silent = true;
        };
      }
      {
        action = "<CMD>close<CR>";
        key = "<leader>sx";
        mode = "n";
        options = {
          desc = "Close Split Window";
          silent = true;
        };
      }
      {
        action = "<CMD>bd<CR>";
        key = "<leader>x";
        mode = "n";
        options = {
          desc = "Close Buffer";
          silent = true;
        };
      }
      {
        action = "<C-w>=";
        key = "<leader>se";
        mode = "n";
        options = {
          desc = "Equalize Split Windows";
          silent = true;
        };
      }
      {
        action = "<C-w>_";
        key = "<leader>sm";
        mode = "n";
        options = {
          desc = "Maximize Split Window";
          silent = true;
        };
      }
      {
        action = "<CMD>nohlsearch<CR>";
        key = "<ESC>";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<CMD>Obsidian new<CR>";
        key = "<leader>on";
        mode = "n";
        options = {
          desc = "Obsidian New Note";
          silent = true;
        };
      }
      {
        action = "<CMD>Obsidian paste_img<CR>";
        key = "<leader>op";
        mode = "n";
        options = {
          desc = "Obsidian Paste Image";
          silent = true;
        };
      }
      {
        action = "<CMD>Obsidian today<CR>";
        key = "<leader>ot";
        mode = "n";
        options = {
          desc = "Obsidian Today Note";
          silent = true;
        };
      }
      {
        action = "<CMD>Obsidian search<CR>";
        key = "<leader>os";
        mode = "n";
        options = {
          desc = "Obsidian Search";
          silent = true;
        };
      }
    ];
  };
}
