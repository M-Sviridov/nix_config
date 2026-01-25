{pkgs, ...}: {
  fonts.packages = import ../shared/fonts.nix {inherit pkgs;};
}
