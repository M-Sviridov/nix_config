{pkgs, ...}: {
  # Enable RealtimeKit for audio purposes
  security.rtkit.enable = true;

  # Services to start
  services = {
    # openssh.enable = true;

    gvfs.enable = true;

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

    tailscale = {
      enable = true;
      authKeyFile = "/run/secrets/tailscale_key";
      extraUpFlags = ["--accept-dns" "--accept-routes"];
    };
  };
}
