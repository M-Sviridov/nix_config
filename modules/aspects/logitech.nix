{inputs, ...}: {
  flake-file.inputs = {
    solaar = {
      url = "github:Svenum/Solaar-Flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  my.logitech.nixos = {pkgs, ...}: {
    imports = [inputs.solaar.nixosModules.default];

    hardware.logitech.wireless.enable = true;

    environment.systemPackages = with pkgs; [
      gnomeExtensions.solaar-extension
    ];

    services.solaar = {
      enable = true;
      batteryIcons = "solaar";
      window = "hide";
    };
  };
}
