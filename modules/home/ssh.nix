{...}: {
  programs.ssh = {
    enable = true;
    compression = true;
    forwardAgent = true;

    extraConfig = ''
      Host *
        User msviridov
        Port 22
        IdentityFile ~/.ssh/ansible-controller_key

      Host github.com
        IdentityFile ~/.ssh/github_key

      Host ansible
        Hostname ansible-controller

      Host caddy
        Hostname caddy

      Host docker-vm01
        Hostname docker-vm01

      Host podman-vm01
        Hostname podman-vm01
    '';
  };
}
