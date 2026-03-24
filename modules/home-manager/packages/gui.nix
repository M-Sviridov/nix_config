{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.my.packages.gui;
in {
  options.my.packages.gui.enable = mkEnableOption "gui packages";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      anki
      bitwarden-desktop
      bruno
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
      signal-desktop
      todoist-electron
      trezor-suite
      winbox4
      pear-desktop
    ];
  };
}
