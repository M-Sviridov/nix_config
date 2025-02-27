{...}: {
  programs.ssh = {
    enable = true;
    compression = true;
    forwardAgent = true;

    extraConfig = ''
      Host *
        User msviridov
        Port 22

      Host github.com
        IdentityFile ~/.ssh/github_key

      Host ansible
        Hostname ansible-controller.tails
        IdentityFile ~/.ssh/ansible-controller_key
    '';
  };
}
