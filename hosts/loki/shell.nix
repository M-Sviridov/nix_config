{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    python3
    python312Packages.influxdb-client
    python312Packages.pandas
    python312Packages.python-dotenv
  ];
}
