{
  fonts = import ./fonts.nix;
  homebrew = import ./homebrew.nix;
  networking = import ./networking.nix;
  nix = import ./nix.nix;
  packages = import ./packages.nix;
  system = import ./system.nix;
}
