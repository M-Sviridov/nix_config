{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    completionInit = ''
      autoload -Uz compinit
      for dump in $ZDOTDIR/.zcompdump(N.mh+24); do
        compinit
      done
      compinit -C
    '';

    dotDir = ".config/zsh";

    history = {
      append = true;
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
      ignoreAllDups = true;
      path = "$ZDOTDIR/.zsh_history";
    };

    initExtra = ''
      eval "$(zoxide init --cmd cd zsh)"
      zstyle ':completion:*' completer _complete _ignored _files
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':fzf-tab:*' use-fzf-default-opts yes
      zstyle ':completion:*' menu no
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

    sessionVariables = {
      BITWARDEN_SSH_AUTH_SOCK = "/run/user/1000/bitwarden_ssh.sock";
      NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/npmrc";
      RUSTUP_HOME = "$XDG_CONFIG_HOME/rustup";
      CARGO_HOME = "$XDG_CONFIG_HOME/cargo";
      GNUPGHOME = "$XDG_CONFIG_HOME/gnupg";
      TERMINAL = "wezterm";
      EDITOR = "nvim";
      VISUAL = "nvim";
      LS_COLORS = "$(vivid generate catppuccin-mocha)";
    };

    shellAliases = {
      cat = "bat";
      grep = "grep --color=auto";
      ipa = "ip -c -br a";
      lsa = "eza -lhga -F --group-directories-first";
      ls = "eza -lhg -F --group-directories-first";
      ".." = "cd ..";
      tree = "tree -C";
      update = "sudo nixos-rebuild switch --flake .#loki";

      tm = "tmux";
      tmat = "tmux attach-session -t";
      tmks = "tmux kill-session -a";
      tmls = "tmux list-session";
      tmns = "tmux new -s";

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

      tofigen = "rm $XDG_CACHE_HOME/tofi-*";
    };

    syntaxHighlighting.enable = true;
  };
}
