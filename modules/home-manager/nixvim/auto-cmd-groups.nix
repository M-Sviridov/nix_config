{...}: {
  programs.nixvim = {
    autoCmd = [
      {
        callback = {__raw = "function() vim.highlight.on_yank() end";};
        desc = "Highlight when yanking (copying) text";
        event = "TextYankPost";
        group = "highlight-yank";
      }
    ];

    autoGroups = {
      highlight-yank.clear = true;
    };
  };
}
