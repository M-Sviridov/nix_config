{
  host,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
    ../../hosts/${host}/hardware.nix
    ../../modules/core
    ../../modules/drivers
    ./fw-fanctrl.nix
  ];
  # Enable GPU Drivers
  drivers.amdgpu.enable = true;
  # drivers.nvidia.enable = false;
  # drivers.nvidia-prime = {
  #   enable = false;
  #   intelBusID = "";
  #   nvidiaBusID = "";
  # };
  # drivers.intel.enable = false;
  # vm.guest-services.enable = false;
}
