{ host, ... }:

{
  imports = [
    ../../hosts/${host}/hardware.nix
    ../../modules/core
    ../../modules/drivers
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


