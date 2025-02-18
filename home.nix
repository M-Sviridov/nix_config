{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "msviridov";
  home.homeDirectory = "/home/msviridov";

  stylix.targets = {
    firefox.enable = false;
    hyprland.enable = false;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      inputs.hyprsplit.packages."${pkgs.stdenv.hostPlatform.system}".hyprsplit
    ];

    settings = {
      monitor = [
	",preferred,auto,auto"
      ];

      exec-once = [
	# "uwsm app -- solaar --window=hide --battery-icons=solaar"
	# "uwsm app -- bitwarden-desktop"
	# "uwsm app -- clipse -listen"
	# "uwsm app -- hyprpanel"
	# "uwsm app -- udiskie"
      ];

      "plugin:hyprsplit" = {
        num_workspaces = 5;
	persistent_workspaces = true;
      };

      input = {
        kb_layout = "us";
	kb_options = [ "ctrl:nocaps" ];
	follow_mouse = 1;
	sensitivity = 0.1; # -1.0 - 1.0, 0 means no modification.
	touchpad = {
	  natural_scroll = true;
	  scroll_factor = 0.3;
	};
	repeat_delay = 200;
	repeat_rate = 50;
      };

      general = {
        "$mainMod" = "SUPER";
        "$browser" = "firefox";
        "$terminal" = "wezterm";
        "$fileManager" = "nautilus";
        "$menu" = "tofi-drun --drun-launch=true";
	gaps_in = 4;
	gaps_out = 8;
	border_size = 2;
	layout = "dwindle";
	resize_on_border = true;
	"col.active_border" = "rgba(cba6f7ee) rgba(f5e0dcee) 45deg";
	"col.inactive_border" = "rgba(595959aa)";
      };

      decoration = {
	rounding = 10;

	shadow = {
	  enabled = true;
	  range = 4;
	  render_power = 3;
	  color = "rgba(1a1a1aee)";
	};

	blur = {
	  enabled = true;
	  size = 8;
	  passes = 2;
	  vibrancy = 0.1696;
	};
      };

      animations = {
	enabled = true;
	bezier = [
	  "easeOutQuint,0.23,1,0.32,1"
    	  "easeInOutCubic,0.65,0.05,0.36,1"
    	  "linear,0,0,1,1"
    	  "almostLinear,0.5,0.5,0.75,1.0"
   	  "quick,0.15,0,0.1,1"
	];
	animation = [
	  "global, 1, 10, default"
	  "border, 1, 5.39, easeOutQuint"
	  "windows, 1, 4.79, easeOutQuint"
	  "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
	  "windowsOut, 1, 1.49, linear, popin 87%"
	  "fadeIn, 1, 1.73, almostLinear"
	  "fadeOut, 1, 1.46, almostLinear"
	  "fade, 1, 3.03, quick"
	  "layers, 1, 3.81, easeOutQuint"
	  "layersIn, 1, 4, easeOutQuint, fade"
	  "layersOut, 1, 1.5, linear, fade"
	  "fadeLayersIn, 1, 1.79, almostLinear"
	  "fadeLayersIn, 1, 1.79, almostLinear"
	  "fadeLayersOut, 1, 1.39, almostLinear"
	  "workspaces, 1, 1.94, almostLinear, fade"
	  "workspacesIn, 1, 1.21, almostLinear, fade"
	  "workspacesOut, 1, 1.94, almostLinear, fade"
	];
      };

      dwindle = {
	pseudotile = true;
	preserve_split = true;
      };

      master = {
	new_status = "master";
      };

      misc = {
	force_default_wallpaper = -1;
	disable_hyprland_logo = true;
      };

      bind = [
	"$mainMod, E, exec, uwsm app -- $fileManager"
	"$mainMod, Q, exec, uwsm app -- $terminal"
	"$mainMod, O, exec, hyprctl dispatch exit"
	"$mainMod, F, exec, uwsm app -- $browser"
	"ctrl, space, exec, uwsm app -- $menu"
	"$mainMod, T, togglefloating"
	"ctrl alt, Q, exec, hyprlock"
	"$mainMod, p, togglesplit"
	"$mainMod, c, killactive"
	"$mainMod, m, fullscreen"
        "ctrl, 1, split:workspace, 1"
        "ctrl, 2, split:workspace, 2"
        "ctrl, 3, split:workspace, 3"
        "ctrl, 4, split:workspace, 4"
        "ctrl, 5, split:workspace, 5"
        "ctrl SHIFT, 1, split:movetoworkspace, 1"
        "ctrl SHIFT, 2, split:movetoworkspace, 2"
        "ctrl SHIFT, 3, split:movetoworkspace, 3"
        "ctrl SHIFT, 4, split:movetoworkspace, 4"
        "ctrl SHIFT, 5, split:movetoworkspace, 5"
	"$mainMod, R, split:grabroguewindows"
	"$mainMod, h, movefocus, l"
	"$mainMod, l, movefocus, r"
	"$mainMod, k, movefocus, u"
	"$mainMod, j, movefocus, d"
	"$mainMod, 1, movewindow, mon:eDP-1"
	"$mainMod, 2, movewindow, mon:DP-2"
	"$mainMod, S, togglespecialworkspace, magic"
        "ctrl SHIFT, S, split:movetoworkspace, special:magic"
	"$mainMod, V, exec, uwsm app -- $terminal start --class clipse -e 'clipse'"
      ];

      bindm = [
	"$mainMod, mouse:272, movewindow"
	"$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
	",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
	",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
	",XF86AudioNext, exec, playerctl next"
	",XF86AudioPause, exec, playerctl play-pause"
	",XF86AudioPlay, exec, playerctl play-pause"
	",XF86AudioPrev, exec, playerctl previous"
      ];

      windowrulev2 = [
	"suppressevent maximize, class:.*"
	"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
	"float, class:(clipse)"
	"size 622 652, class:(clipse)"
	"noanim, class:(clipse)"
	"float, class:(org.gnome.NautilusPreviewer)"
      ];

      workspace = [
	"special:magic, gapsout:100"
	"special:magic, on-created-empty:uwsm app -- $terminal"
      ];
    };
  };

  programs.git = {
    enable = true;
    userName = "M-Sviridov";
    userEmail = "74146348+M-Sviridov@users.noreply.github.com";
    extraConfig = {
      color.ui = "auto";
      init.defaultBranch = "main";
    };
  };

  programs.starship.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.bitwarden-desktop
    pkgs.brightnessctl
    pkgs.chezmoi
    pkgs.playerctl
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

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
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

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
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
