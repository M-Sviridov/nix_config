{ ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    compression = true;

    matchBlocks = {
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

      "dmz-calibre" = {
        hostname = "dmz-calibre-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "dmz-freshrss" = {
        hostname = "dmz-freshrss-server";
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

      "dmz-openwebui" = {
        hostname = "dmz-openwebui-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "dmz-vaultwarden" = {
        hostname = "dmz-vaultwarden-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "docker" = {
        hostname = "docker-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "fileserver" = {
        hostname = "fileserver-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "grafana" = {
        hostname = "grafana-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "github.com" = {
        identityFile = "~/.ssh/github_key";
      };

      "haos-aopo" = {
        hostname = "haos-aopo";
        user = "root";
        identityFile = "~/.ssh/haos-aopo_key";
      };

      "heimdall" = {
        hostname = "heimdall";
        user = "root";
        identityFile = "~/.ssh/heimdall_key";
      };

      "hetzner" = {
        hostname = "188.245.176.92";
        user = "msviridov";
        identityFile = "~/.ssh/hetzner_key";
      };

      "influxdb" = {
        hostname = "influxdb-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "prod-caddy" = {
        hostname = "prod-caddy-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "prod-control" = {
        hostname = "prod-control-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "prod-frigate" = {
        hostname = "prod-frigate-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "prod-pms" = {
        hostname = "prod-pms-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "jellyfin" = {
        hostname = "jellyfin-server";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "opnsense" = {
        hostname = "opnsense-router";
        user = "msviridov";
        identityFile = "~/.ssh/opnsense_key";
      };

      "raspi" = {
        hostname = "raspi";
        user = "msviridov";
      };
    };
  };
}
