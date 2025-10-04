{...}: {
  imports = [
    ./auto-cmd-groups.nix
    ./blink-cmp.nix
    ./colorschemes.nix
    ./diagnostic.nix
    ./extra-plugins.nix
    ./formatter.nix
    ./highlights.nix
    ./keymaps.nix
    # ./linter.nix
    ./lsp.nix
    ./lualine.nix
    ./mini.nix
    ./noice.nix
    ./oil.nix
    ./obsidian.nix
    ./options.nix
    ./snacks.nix
    ./tiny-diag.nix
    ./treesitter.nix
  ];

  programs.nixvim.enable = true;
}
