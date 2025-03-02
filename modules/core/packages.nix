{
  pkgs,
  inputs,
  ...
}: {
  environment.shells = with pkgs; [
    zsh
  ];

  environment.systemPackages = with pkgs; [
    bitwarden-desktop
    brightnessctl
    cifs-utils
    dig
    duf
    eza
    ffmpeg
    fw-ectool
    gcc
    gnomeExtensions.solaar-extension
    gnumake
    jellyfin-mpv-shim
    killall
    mpv
    obsidian
    nvme-cli
    nwg-look
    playerctl
    protonvpn-gui
    ripgrep
    rose-pine-cursor
    rustup
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    sshfs
    tree
    unrar
    unzip
    vivid
    wget
    zoxide
  ];

  programs = {
    localsend = {
      enable = true;
      openFirewall = true;
    };
  };
}
