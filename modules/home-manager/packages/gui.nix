{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.packages.gui;
in {
  options.packages.gui.enable = mkEnableOption "gui packages";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      anki
      bitwarden-desktop
      evince
      feishin
      jellyfin-mpv-shim
      loupe
      mpv
      mqtt-explorer
      nautilus
      nwg-look
      obsidian
      protonvpn-gui
      signal-desktop-bin
      todoist-electron
      trezor-suite
      winbox4
      youtube-music
    ];
  };
}
