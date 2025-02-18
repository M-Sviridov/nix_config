{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    btop
    duf
    eza
    ffmpeg
    fw-ectool
    killall
    mpv
    nvme-cli
    playerctl
    ripgrep
    tree
    unrar
    unzip
    wget
  ];
}

