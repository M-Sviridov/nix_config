{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.my.packages.utils;
in {
  options.my.packages.utils.enable = mkEnableOption "utils packages";

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
