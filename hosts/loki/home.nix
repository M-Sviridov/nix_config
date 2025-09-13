{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.alacritty
    outputs.homeManagerModules.anki
    outputs.homeManagerModules.catppuccin
    outputs.homeManagerModules.easyeffects
    # outputs.homeManagerModules.firefox
    outputs.homeManagerModules.gammastep
    outputs.homeManagerModules.ghostty
    outputs.homeManagerModules.git
    outputs.homeManagerModules.gtk
    outputs.homeManagerModules.hyprland
    # outputs.homeManagerModules.niri
    outputs.homeManagerModules.nvf
    outputs.homeManagerModules.packages
    outputs.homeManagerModules.shell
    outputs.homeManagerModules.ssh
    outputs.homeManagerModules.tmux
    outputs.homeManagerModules.vicinae
    outputs.homeManagerModules.wezterm
    outputs.homeManagerModules.zen-browser

    inputs.catppuccin.homeModules.catppuccin
    # inputs.niri.homeModules.niri
    inputs.nvf.homeManagerModules.default
    inputs.vicinae.homeManagerModules.default
    inputs.zen-browser.homeModules.twilight
  ];

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      inputs.niri.overlays.niri
    ];
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "ventoy-1.1.07"
        "qtwebengine-5.15.19"
      ];
    };
  };
  home.username = "msviridov";
  home.homeDirectory = "/home/msviridov";

  services.caffeine.enable = true;
  services.gnome-keyring.enable = true;
  services.udiskie = {
    enable = true;
    tray = "never";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    ansible
    bitwarden
    brightnessctl
    ente-auth
    ente-cli
    evince
    ffmpeg
    gcr
    hunspell
    hunspellDicts.fr-any
    hunspellDicts.en_AU-large
    imagemagick
    jellyfin-mpv-shim
    kitty
    loupe
    mpv
    mqtt-explorer
    nautilus
    nwg-look
    obsidian
    protonvpn-gui
    rustup
    signal-desktop-bin
    sqlite
    sshpass
    sushi
    trezor-suite
    ventoy
    winbox4
    youtube-music

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
  # # Building this configuration will create a copy of 'dotfiles/screenrc' in
  # # the Nix store. Activating the configuration will then make '~/.screenrc' a
  # # symlink to the Nix store copy.
  # ".screenrc".source = dotfiles/screenrc;

  # # You can also set the file content immediately.
  # ".gradle/gradle.properties".text = ''
  #   org.gradle.console=verbose
  #   org.gradle.daemon.idletimeout=3600000
  # '';
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/msviridov/etc/profile.d/hm-session-vars.sh
  #
  # home.sessionVariables = {
  # EDITOR = "emacs";
  # };

  home.shell.enableZshIntegration = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
