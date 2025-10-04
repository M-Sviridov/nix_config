{...}: {
  programs.nixvim.highlightOverride = {
    LspInlayHint = {
      blend = 0;
      fg = "#45475a";
      bg = "#1e1e2e";
    };
  };
}
