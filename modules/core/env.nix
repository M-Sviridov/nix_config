{...}: {
  environment.sessionVariables = {
    BITWARDEN_SSH_AUTH_SOCK = "/run/user/1000/bitwarden_ssh.sock";
    NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/npmrc";
    RUSTUP_HOME = "$XDG_CONFIG_HOME/rustup";
    CARGO_HOME = "$XDG_CONFIG_HOME/cargo";
    GNUPGHOME = "$XDG_CONFIG_HOME/gnupg";
    NIXOS_OZONE_WL = "1";
    YSU_HARDCORE = "1"; # Hardcore mode for zsh-you-should-use
  };

  environment.pathsToLink = ["/share/zsh"];
}
