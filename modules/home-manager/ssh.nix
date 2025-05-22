{...}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    compression = true;

    matchBlocks = {
      "caddy" = {
        hostname = "caddy-server.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "dmz-authentik" = {
        hostname = "dmz-authentik-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "dmz-caddy" = {
        hostname = "dmz-caddy-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "dmz-immich" = {
        hostname = "dmz-immich-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "dmz-jellyfin" = {
        hostname = "dmz-jellyfin-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "dmz-vaultwarden" = {
        hostname = "dmz-vaultwarden-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "docker" = {
        hostname = "docker-server.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "fileserver" = {
        hostname = "fileserver-server.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "grafana" = {
        hostname = "grafana-server.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "github.com" = {
        identityFile = "~/.ssh/github_key";
      };

      "heimdall" = {
        hostname = "heimdall.tails";
        user = "root";
        identityFile = "~/.ssh/heimdall_key";
      };

      "hetzner" = {
        hostname = "188.245.176.92";
        user = "msviridov";
        identityFile = "~/.ssh/hetzner_key";
      };

      "influxdb" = {
        hostname = "influxdb-server.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "jellyfin" = {
        hostname = "jellyfin-server.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "opnsense" = {
        hostname = "opnsense-router.tails";
        user = "msviridov";
        identityFile = "~/.ssh/opnsense_key";
      };
    };
  };
}
