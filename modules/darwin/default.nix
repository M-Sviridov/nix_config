{
  fonts = import ./fonts.nix;
  networking = import ./networking.nix;
  nix = import ./nix.nix;
  packages = import ./packages.nix;
  system = import ./system.nix;
}
