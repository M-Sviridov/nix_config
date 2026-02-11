{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.my.packages.common;
in {
  options.my.packages.common.enable = mkEnableOption "common packages";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ansible
      awscli2
      # bootdev-cli
      ffmpeg
      goose
      hunspell
      hunspellDicts.en_AU-large
      hunspellDicts.fr-any
      hunspellDicts.th_TH
      imagemagick
      jq
      opentofu
      postgresql
      sqlc
      sqlite
      uv
      wget
    ];
  };
}
