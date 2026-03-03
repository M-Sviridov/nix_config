{...}: {
  services.tailscale = {
    enable = true;
    extraUpFlags = ["--accept-dns"];
  };
}
