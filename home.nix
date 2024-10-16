{
  pkgs,
  lib,
  config,
  # alejandra,
  ...
}: {
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    _1password
    # alejandra.defaultPackage.aarch64-darwin
    bat
    fzf
    gh
    gnupg
    jq
    lsd
    neovim
    pure-prompt
    tmux
  ];

  home.file = {
    # ".zshenv".source = ./zsh/zshenv;
    # Remove this line as we're now using the Nix configuration
    # ".config/tmux/tmux.conf".source = ./tmux/tmux.conf;
    "bin/t".source = ./scripts/t;

    ".config/1Password/ssh/agent.toml".text = ''
      # Add my Git authentication key from my Work vault
      [[ssh-keys]]
      item = "GitHub SSH Key"
      vault = "Work"
    '';
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
    '';

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "direnv"];
    };

    shellAliases = {
      # SSH
      gogogo = "ssh -i ~/.ssh/replit -p 22 5dbe8df1-a623-4cc2-a30e-c954e2114be0@5dbe8df1-a623-4cc2-a30e-c954e2114be0-00-20lqwhdcc1630.kirk.replit.dev";

      # Navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      df = "vim $HOME/dotfiles";
      dfa = "vim $HOME/dotfiles/aliases.zsh";
      dfz = "vim $HOME/dotfiles/zshrc.zsh";

      # System
      ls = "lsd";
      cat = "bat";
      reloaddns = "dscacheutil -flushcache && sudo killall -HUP mDNSResponder";
      l = "lsd -1A --group-directories-first";
      ll = "lsd -1Al --header --group-directories-first";
      s = "subl";
      vim = "nvim";
      h = "history | tail -n 50";

      # Directories
      work = "cd $HOME/code/replicatedhq/data";
      me = "cd $HOME/code/tomnagengast";

      # dbt
      dl = "uv run dbt ls -s state:modified --resource-type model";
      dr = "uv run dbt run -s state:modified";
      drm = "uv run dbt run -s";
      db = "uv run dbt build -s state:modified";
      dbm = "uv run dbt build -s";
      dt = "uv run dbt test -m state:modified";
      dtm = "uv run dbt test";

      # GitHub
      npr = "gh pr create --web";
      cpb = "git branch | sed -n -e 's/^\* \(.*\)/\1/p' | pbcopy";
      lpr = "cat ~/code/replicatedhq/__templates/dbt_pr.md | pbcopy";
      runs = "gh run watch -R $(git remote get-url origin | sed -E 's|.*github\.com[:/](.+/[^/]+)\.git|\\1|') .git)";

      # Snowflake
      snowsql = "/Applications/SnowSQL.app/Contents/MacOS/snowsql";
      snf = "snowsql";

      # Laravel
      art = "php artisan";
      a = "php artisan";
      fresh = "php artisan migrate:fresh --seed";

      # Git
      clean-local-branches = "git branch | grep -v \"main\" | xargs git branch -D";
      amend = "git add -A && git commit --amend --no-edit";
      ga = "git add -A && git commit -m";
      nah = "git clean -df && git reset --hard";
      oops = "git reset --soft HEAD~1";
      pull = "git pull";
      push = "git push";
      resolve = "git add . && git commit --no-edit";
      unstage = "git restore --staged .";
      wip = "ga wip";
      wipp = "wip && push";
      aye = "git checkout";
      gl = "glo";
      gs = "gss";
      gr = "git recent -n 5";
      ggo = "g go";

      # Utilities
      cleanpy = "find . -type d -name '__pycache__' -exec rm -r {} +";
      cleands = "find . -type f -name '*.DS_Store' -ls -delete";
      cleanbak = "find . -type f -name '*.bak' -ls -delete";
      cleanup = "cleanpy && cleands && cleanbak";
      week = "date +%V";
      localip = "ipconfig getifaddr en0";
      hidedesktop = "defaults write com.apple.finder CreateDesktop -bool false && killall Finder";
      showdesktop = "defaults write com.apple.finder CreateDesktop -bool true && killall Finder";
      path = "echo $PATH | tr ':' '\\n'";
    };
  };

  programs.bat = {
    enable = true;
    config.theme = "GitHub";
  };

  programs.git = {
    enable = true;
    userEmail = "tnagengast@gmail.com";
    userName = "tomnagengast";
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB3FOfHxMK6gmUS+IAjVKt8ZuAO4nrZbi5HgXJfF0BTZ";
      signByDefault = true;
    };
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
        followTags = true;
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
    shell = "${pkgs.zsh}/bin/zsh";
    # Import the tmux configuration from tmux/tmux.nix
    extraConfig = builtins.readFile ./tmux/tmux.nix;
    plugins = with pkgs.tmuxPlugins; [
      # Add any tmux plugins you want to use here
    ];
  };
}
