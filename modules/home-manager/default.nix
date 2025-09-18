{
  alacritty = import ./alacritty.nix;
  anki = import ./anki.nix;
  catppuccin = import ./catppuccin.nix;
  firefox = import ./firefox;
  gammastep = import ./gammastep.nix;
  ghostty = import ./ghostty.nix;
  git = import ./git.nix;
  gtk = import ./gtk.nix;
  hyprland = import ./hyprland;
  niri = import ./niri.nix;
  nixvim = import ./nixvim.nix;
  nvf = import ./nvf;
  packages = import ./packages.nix;
  programs = import ./programs.nix;
  services = import ./services.nix;
  shell = import ./shell;
  ssh = import ./ssh.nix;
  tmux = import ./tmux.nix;
  wezterm = import ./wezterm;
  zen-browser = import ./zen-browser;
}
