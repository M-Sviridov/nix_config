{pkgs, ...}: {
  hardware.logitech.wireless.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.solaar-extension
  ];

  services.solaar = {
    enable = true;
    batteryIcons = "solaar";
    window = "hide";
  };
}
