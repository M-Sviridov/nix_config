{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.my.shell.zsh;
  inherit (pkgs.stdenv) isDarwin isLinux;

  # Alias groups defined separately for clarity
  commonAliases = {
    c = "clear";
    cat = "bat";
    grep = "grep --color=auto";
    lsa = "eza -lhga -F --group-directories-first";
    ls = "eza -lhg -F --group-directories-first";
    mkdir = "mkdir -p";
    ".." = "cd ..";
    tree = "tree -C";
    ssha = "eval $(ssh-agent) && ssh-add ~/.ssh/heimdall_key";
  };

  tmuxAliases = {
    tm = "tmux";
    tmat = "tmux attach-session -t";
    tmks = "tmux kill-session -a";
    tmls = "tmux list-session";
    tmns = "tmux new -s";
  };

  gitAliases = {
    ga = "git add";
    gaa = "git add .";
    gd = "git diff";
    gcl = "git clone";
    gcm = "git commit -m";
    gl = "git log";
    gp = "git pull";
    gpo = "git push -u origin";
    gpom = "git push -u origin main";
    gr = "git restore";
    gs = "git status";
  };

  linuxAliases = optionalAttrs isLinux {
    ipa = "ip -c -br a";
    tofigen = "rm $XDG_CACHE_HOME/tofi-*";
  };

  nixAliases =
    {nix-clean = cfg.cleanCommand;}
    // optionalAttrs (cfg.rebuildCommand != null) {nix-rebuild = cfg.rebuildCommand;}
    // optionalAttrs (cfg.upgradeCommand != null) {nix-upgrade = cfg.upgradeCommand;}
    // optionalAttrs (cfg.homeRebuildCommand != null) {hm-rebuild = cfg.homeRebuildCommand;};
in {
  options.my.shell.zsh = {
    enable = mkEnableOption "Zsh shell with opinionated defaults";

    sshAuthSock = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "/home/user/.bitwarden-ssh-agent.sock";
      description = "Path to SSH agent socket (e.g., Bitwarden SSH agent)";
    };

    rebuildCommand = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "sudo nixos-rebuild switch --flake .#myhost";
      description = "Command for the 'nix-rebuild' alias";
    };

    upgradeCommand = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "nix flake update && sudo nixos-rebuild switch --flake .#myhost";
      description = "Command for the 'nix-upgrade' alias (updates flake inputs first)";
    };

    cleanCommand = mkOption {
      type = types.str;
      default = "nix-collect-garbage -d";
      description = "Command for the 'nix-clean' alias (garbage collection)";
    };

    homeRebuildCommand = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "home-manager switch --flake .#user@host";
      description = "Command for the 'hm-rebuild' alias";
    };

    extraAliases = mkOption {
      type = types.attrsOf types.str;
      default = {};
      description = "Additional shell aliases merged with defaults";
    };

    extraSessionVariables = mkOption {
      type = types.attrsOf (types.oneOf [types.str types.int]);
      default = {};
      description = "Additional session variables merged with defaults";
    };
  };

  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      completionInit = ''
        autoload -Uz compinit
        for dump in $ZDOTDIR/.zcompdump(N.mh+24); do
          compinit
        done
        compinit -C
      '';

      dotDir = "${config.xdg.configHome}/zsh";

      history = {
        append = true;
        share = true;
        ignoreDups = true;
        ignoreSpace = true;
        ignoreAllDups = true;
        path = "$ZDOTDIR/.zsh_history";
      };

      initContent = ''
        zstyle ':completion:*' completer _complete _ignored _files
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
        zstyle ':fzf-tab:*' use-fzf-default-opts yes
        zstyle ':completion:*' menu no
        bindkey '^O' clear-screen
      '';

      plugins = [
        {
          name = "fzf-tab";
          src = pkgs.fetchFromGitHub {
            owner = "Aloxaf";
            repo = "fzf-tab";
            rev = "v1.2.0";
            sha256 = "sha256-q26XVS/LcyZPRqDNwKKA9exgBByE0muyuNb0Bbar2lY=";
          };
        }
        {
          name = "zsh-vi-mode";
          src = pkgs.fetchFromGitHub {
            owner = "jeffreytse";
            repo = "zsh-vi-mode";
            rev = "v0.11.0";
            sha256 = "sha256-xbchXJTFWeABTwq6h4KWLh+EvydDrDzcY9AQVK65RS8=";
          };
        }
        {
          name = "zsh-you-should-use";
          src = pkgs.fetchFromGitHub {
            owner = "MichaelAquilina";
            repo = "zsh-you-should-use";
            rev = "1.9.0";
            sha256 = "sha256-+3iAmWXSsc4OhFZqAMTwOL7AAHBp5ZtGGtvqCnEOYc0=";
          };
        }
      ];

      sessionVariables =
        {
          NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/npmrc";
          RUSTUP_HOME = "$XDG_CONFIG_HOME/rustup";
          CARGO_HOME = "$XDG_CONFIG_HOME/cargo";
          TERMINAL = "wezterm";
          EDITOR = "nvim";
          VISUAL = "nvim";
          PATH = "$PATH:$HOME/.npm-global/bin:$HOME/go/bin";
          YSU_HARDCORE = 1;
        }
        // optionalAttrs (cfg.sshAuthSock != null) {SSH_AUTH_SOCK = cfg.sshAuthSock;}
        // cfg.extraSessionVariables;

      shellAliases =
        commonAliases
        // tmuxAliases
        // gitAliases
        // linuxAliases
        // nixAliases
        // cfg.extraAliases;
    };
  };
}
