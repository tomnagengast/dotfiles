{ config, pkgs, ... }:

{
  home.stateVersion = "24.05";

  home.packages = [
    pkgs.uv
  ];
  
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    ".config/1Password/ssh/agent.toml".text = ''
      # Add my Git authentication key from my Work vault
      [[ssh-keys]]
      item = "GitHub SSH Key"
      vault = "Work"
    '';
  };
  
  home.sessionVariables = {
    EDITOR = "cursor";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Git
  programs.git = {
    enable = true;
    userEmail = "tnagengast@gmail.com";
    userName = "tomnagengast";
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB3FOfHxMK6gmUS+IAjVKt8ZuAO4nrZbi5HgXJfF0BTZ";
      signByDefault = true;
    };
    extraConfig = {
      gpg = {
        format = "ssh";
        ssh = {
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };
      };
      credential = {
        helper = "osxkeychain";
      };
      color = {
        ui = "auto";
      };
      diff = {
        renames = "copies";
      };
      push = {
        default = "simple";
        followTags = true;
        autoSetupRemote = true;
      };
      pull = {
        rebase = false;
      };
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

  programs.zsh = {
    enable = true;
    initExtra = ''
      autoload -U promptinit
      promptinit
      prompt pure
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      extraConfig = ''
        zstyle ':omz:update' mode auto

        zstyle :prompt:pure:git:branch color '#56526e'
        zstyle :prompt:pure:git:dirty color '#56526e'
        zstyle :prompt:pure:path color green
        zstyle ':prompt:pure:prompt:*' color cyan
        zstyle :prompt:pure:prompt:continuation color cyan
        zstyle :prompt:pure:virtualenv color cyan
      '';
    };
  };
}
