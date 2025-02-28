{...}: {
  boot = {
    consoleLogLevel = 0;

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    initrd.luks.devices.cryptlvm.device = "/dev/disk/by-uuid/9f336d46-cc1d-4a3c-9209-7ab21f42be8f";
    initrd.verbose = false;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = true;
    plymouth.enable = true;
  };
}
