{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    cifs-utils
    dig
    duf
    eza
    ffmpeg
    fw-ectool
    killall
    mpv
    nvme-cli
    playerctl
    ripgrep
    rose-pine-cursor
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    tree
    unrar
    unzip
    vivid
    wget
    zoxide
  ];
}
