# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Enable experimental features
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  stylix = { 
    enable = true;
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/orangci/walls-catppuccin-mocha/master/city-horizon.jpg";
      sha256 = "sha256-TWPC7opJ1F0AUNJ6yBwUTrFBrHy7GquDJiqS47p/zVQ=";
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts = {
      serif = config.stylix.fonts.sansSerif;

      sansSerif = {
        package = pkgs.noto-fonts;
	name = "Noto Sans";
      };

      monospace = {
        package = pkgs.noto-fonts;
	name = "Maple Mono NF";
      };

      emoji = {
        package = pkgs.noto-fonts;
	name = "Noto Sans Emoji";
      };
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices.cryptlvm.device = "/dev/disk/by-uuid/9f336d46-cc1d-4a3c-9209-7ab21f42be8f";

  networking.hostName = "loki";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  services.greetd.enable = true; 

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
    authKeyFile = "/run/secrets/tailscale_key";
    extraUpFlags = [ "--accept-dns" "--accept-routes" ];
  };

  # Set zsh as the default user shell
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.msviridov = {
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "password";
    isNormalUser = true;
    packages = with pkgs; [
      nautilus
      tree
      wezterm
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "msviridov" = import ./home.nix;
    };
  };

  # List of programs you want to enable

  programs.firefox = {
    enable = true;
    policies = {
      DisableFirefoxAccounts = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DNSOverHTTPS = {
	Fallback = false;
      };
      EnableTrackingProtection = {
	Value = true;
	Locked = true;
	Cryptomining = true;
	Fingerprinting = true;
      };
      ExtensionSettings = {
        # "*".installation_mode = "blocked";
	"ublock0@raymondhill.net" = {
	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
	  installation_mode = "force_installed";
	};
	"{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
	  installation_mode = "force_installed";
	};
	"FirefoxColor@mozilla.com" = {
	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox-color/latest.xpi";
	  installation_mode = "force_installed";
	};
      };
      Homepage = {
        URL = "https://todo.lan.msviridov.com";
	StartPage = "homepage";
      };
      HttpsOnlyMode = "enabled";
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      PictureInPicture = false;
    };
  };

  programs.git.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.regreet.enable = true;

  programs.zsh = { 
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    fw-ectool
    neovim
    wget
  ];

  # Set required environment session variables
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  fonts.packages = with pkgs; [
    maple-mono-NF
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

