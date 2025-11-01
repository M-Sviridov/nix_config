{
  anki = import ./anki.nix;
  catppuccin = import ./catppuccin.nix;
  delta = import ./delta.nix;
  firefox = import ./firefox;
  gammastep = import ./gammastep.nix;
  git = import ./git.nix;
  gtk = import ./gtk.nix;
  hyprland = import ./hyprland;
  nixvim = import ./nixvim;
  nvf = import ./nvf;
  packages = import ./packages;
  programs = import ./programs.nix;
  services = import ./services.nix;
  shell = import ./shell;
  ssh = import ./ssh;
  tmux = import ./tmux.nix;
  waybar = import ./waybar.nix;
  wezterm = import ./wezterm;
  xdg = import ./xdg.nix;
  zen-browser = import ./zen-browser;
}
