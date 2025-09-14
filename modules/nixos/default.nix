{
  amd-graphics = import ./amd-graphics.nix;
  bluetooth = import ./bluetooth.nix;
  boot = import ./boot.nix;
  catppuccin = import ./catppuccin.nix;
  fingerprint = import ./fingerprint.nix;
  fonts = import ./fonts.nix;
  framework-13-7040-amd = import ./framework-13-7040-amd.nix;
  fw-fanctrl = import ./fw-fanctrl.nix;
  gaming = import ./gaming.nix;
  hyprland = import ./hyprland.nix;
  keyd-remapper = import ./keyd-remapper.nix;
  logitech = import ./logitech.nix;
  networking = import ./networking.nix;
  neovim = import ./neovim.nix;
  nix = import ./nix.nix;
  packages = import ./packages.nix;
  programs = import ./programs.nix;
  services = import ./services.nix;
  shares = import ./shares.nix;
  sound = import ./sound.nix;
  tailscale = import ./tailscale.nix;
}
