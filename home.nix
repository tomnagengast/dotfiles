{
  pkgs,
  lib,
  config,
  ...
}: {
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    _1password
    bat
    fzf
    gh
    tree
    gnupg
    jq
    lsd
    neovim
    pure-prompt
    tmux
  ];

  home.file = {
    ".config/nvim".source = ./nvim;
    ".config/nvim".recursive = true;
    ".aliases.zsh".source = ./zsh/aliases.zsh;
    ".functions.zsh".source = ./zsh/functions.zsh;
    ".config/1Password/ssh/agent.toml".source = ./1Password/ssh/agent.toml;
    ".dbt/profiles.yml".source = ./dbt/profiles.yml;
    "bin/t".source = ./scripts/t;
  };

  home.sessionVariables = {
    EDITOR = "cursor";

    DBT_STATE = "target/production";
    DBT_DEFER = "true";
    DBT_CLOUD_ACCOUNT_ID = "211006";
    DBT_CLOUD_PROJECT_ID = "304574";
  };

  home.sessionPath = [
    "$HOME/bin"
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    history.ignoreDups = true;
    history.ignorePatterns = ["ls"];
    initExtra = ''
      zstyle ':omz:update' mode auto

      autoload -U promptinit; promptinit
      zstyle :prompt:pure:git:branch color '#56526e'
      zstyle :prompt:pure:git:dirty color '#56526e'
      zstyle :prompt:pure:path color green
      zstyle ':prompt:pure:prompt:*' color cyan
      zstyle :prompt:pure:prompt:continuation color cyan
      zstyle :prompt:pure:virtualenv color cyan
      prompt pure

      source ~/.orbstack/shell/init.zsh 2>/dev/null || :
      source ~/.aliases.zsh
      source ~/.functions.zsh
    '';

    envExtra = ''
      source ${config.home.homeDirectory}/dotfiles/zsh/zshenv
    '';

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "direnv"];
    };
  };

  programs.bat = {
    enable = true;
    config.theme = "Nord";
  };

  programs.git = {
    enable = true;
    userEmail = "tnagengast@gmail.com";
    userName = "tomnagengast";
    signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB3FOfHxMK6gmUS+IAjVKt8ZuAO4nrZbi5HgXJfF0BTZ";
    signing.signByDefault = true;
    extraConfig = {
      commit.gpgSign = true;
      gpg = {
        format = "ssh";
        ssh = {
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };
      };
      credential.helper = "osxkeychain";
      color.ui = "auto";
      diff.renames = "copies";
      push = {
        default = "simple";
        autoSetupRemote = true;
      };
      pull.rebase = false;
      github.user = "tomnagengast";
      merge.conflictstyle = "diff3";
      init.defaultBranch = "main";
    };
    aliases = {
      # Show the diff between the latest commit and the current state
      d = "!git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat";
      # Switch to a branch, creating it if necessary
      go = "!f() { git checkout -b \"$1\" 2> /dev/null || git checkout \"$1\"; }; f";
      # Show verbose output about tags, branches or remotes
      tags = "tag -l";
      branches = "branch -a";
      remotes = "remote -v";
      # List aliases
      aliases = "config --get-regexp alias";
      # Amend the currently staged files to the latest commit
      amend = "commit --amend --reuse-message=HEAD";
      # Remove branches that have already been merged with master
      dm = "!git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d";
      # List contributors with number of commits
      contributors = "shortlog --summary --numbered";
    };
  };

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux/tmux.conf;
  };
}
