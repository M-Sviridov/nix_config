{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl
    dig
    duf
    fnm
    gcc
    git
    gnumake
    home-manager
    killall
    mas
    nix-output-monitor
    nmap
    usbutils
    p7zip
    rustup
    sqlite
    tree
    unzip
    rar
    wget
    zip
  ];
}
