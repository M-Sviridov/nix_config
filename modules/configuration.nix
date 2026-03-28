# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  den.aspects.fw-laptop = {
    nixos = {
      config,
      pkgs,
      ...
    }: {
      # imports = [
      # Include the results of the hardware scan.
      # ./hardware-configuration.nix
      # ];

      nix.settings.experimental-features = ["nix-command" "flakes"];

      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      # Use latest kernel.
      boot.kernelPackages = pkgs.linuxPackages_latest;

      # networking.hostName = "fw-laptop"; # Define your hostname.

      # Enable networking
      networking.networkmanager.enable = true;

      # Set your time zone.
      time.timeZone = "Asia/Bangkok";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "th_TH.UTF-8";
        LC_IDENTIFICATION = "th_TH.UTF-8";
        LC_MEASUREMENT = "th_TH.UTF-8";
        LC_MONETARY = "th_TH.UTF-8";
        LC_NAME = "th_TH.UTF-8";
        LC_NUMERIC = "th_TH.UTF-8";
        LC_PAPER = "th_TH.UTF-8";
        LC_TELEPHONE = "th_TH.UTF-8";
        LC_TIME = "th_TH.UTF-8";
      };

      # Enable the GNOME Desktop Environment.
      services.displayManager.gdm.enable = true;

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };

      # Enable CUPS to print documents.
      services.printing.enable = true;

      # Enable sound with pipewire.
      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

      services.openssh.enable = true;

      # Install firefox.
      programs.firefox.enable = true;
    };
  };
}
