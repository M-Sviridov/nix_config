{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    bash-language-server
    beautysh
    lua-language-server
    marksman
    markdownlint-cli
    nixd
    nodePackages.prettier
    stylua
    taplo
		tree-sitter
    yaml-language-server
    yamllint
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
