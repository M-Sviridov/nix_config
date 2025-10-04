{...}: {
  programs.nixvim = {
    keymaps = [
      {
        action = "<CMD>lua Snacks.picker.smart()<CR>";
        key = "<leader><space>";
        options = {desc = "Smart Find Files";};
      }
      {
        action = "<CMD>lua Snacks.picker.grep()<CR>";
        key = "<leader>/";
        options = {desc = "Grep";};
      }
      {
        action = "<CMD>lua Snacks.picker.command_history()<CR>";
        key = "<leader>:";
        options = {desc = "Command History";};
      }
      {
        action = "<CMD>lua Snacks.picker.notifications()<CR>";
        key = "<leader>n";
        options = {desc = "Notifications History";};
      }
      {
        action = "<CMD>lua Snacks.picker.buffers()<CR>";
        key = "<leader>fb";
        options = {desc = "Find Buffers";};
      }
      {
        action = "<CMD>lua Snacks.picker.files()<CR>";
        key = "<leader>ff";
        options = {desc = "Find Files";};
      }
      {
        action = "<CMD>lua require('oil').toggle_float()<CR>";
        key = "<C-f>";
        options = {desc = "Toggle Oil Float";};
      }
    ];
  };
}
