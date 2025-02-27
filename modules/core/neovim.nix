{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    bash-language-server
    beautysh
    lua-language-server
    marksman
    markdownlint-cli
    neovim
    nixd
    nodePackages.prettier
    stylua
    taplo
    yaml-language-server
  ];
}
