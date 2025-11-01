{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.packages.utils;
in {
  options.packages.utils.enable = mkEnableOption "utils packages";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ffmpeg
      gcr
      sshpass
      sushi
      ventoy
    ];
  };
}
