{pkgs, ...}: {
  fonts.packages = with pkgs; [
    corefonts
    font-awesome
    maple-mono.NF-unhinted
    material-icons
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    noto-fonts-extra
    overpass
    rubik
  ];
}
