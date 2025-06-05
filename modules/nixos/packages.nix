{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl
    dig
    duf
    fw-ectool
    gcc
    git
    gnumake
    home-manager
    killall
    lm_sensors
    nmap
    usbutils
    nvme-cli
    p7zip
    rustup
    sshfs
    stress-ng
    s-tui
    tree
    unrar
    unzip
    rar
    wget
    zip
  ];
}
