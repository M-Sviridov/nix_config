{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cargo
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
    rustc
    sqlite
    tree
    unzip
    rar
    wget
    zip
  ];
}
