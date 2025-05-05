{...}: {
  services.tailscale = {
    enable = true;
    authKeyFile = "/run/secrets/tailscale_key";
    extraUpFlags = ["--accept-dns"];
  };
}
