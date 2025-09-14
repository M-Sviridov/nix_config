{pkgs, ...}: {
  boot = {
    consoleLogLevel = 0;
    extraModulePackages = [];

    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "thunderbolt" "usbhid"];
      kernelModules = ["dm-snapshot"];
      luks.devices.cryptlvm.device = "/dev/disk/by-uuid/8dbcc588-aca6-4a75-af0d-67bc87433893";
      verbose = false;
    };

    kernelModules = ["amdgpu" "kvm-amd"];
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
    };

    plymouth.enable = true;
  };
}
