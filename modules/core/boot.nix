{ pkgs, config, ... }:
{
	boot = { 
		initrd.luks.devices.cryptlvm.device = "/dev/disk/by-uuid/9f336d46-cc1d-4a3c-9209-7ab21f42be8f";
		loader.efi.canTouchEfiVariables = true;
		loader.systemd-boot.enable = true;
	};
}

