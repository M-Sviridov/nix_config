{pkgs, ...}: {
  # Services to start
  services = {
    openssh.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      # jack.enable = true; # comment or uncomment depending on needs
      pulse.enable = true;
      wireplumber = {
        enable = true;
        extraLv2Packages = with pkgs; [
          calf
          lsp-plugins
        ];
      };
    };
  };
}

