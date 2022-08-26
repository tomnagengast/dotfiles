# Path to your dotfiles.

export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Make ./scripts executable
chmod +x $DOTFILES/scripts/*

# Enable completions
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit && compinit

# Completion for kitty (https://sw.kovidgoyal.net/kitty/#id27)
# kitty + complete setup zsh | source /dev/stdin
ZSH_THEME=""

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    bgnotify
    web-search
)

source $ZSH/oh-my-zsh.sh

# Load Pure iTerm theme
autoload -U promptinit; promptinit
export PURE_PROMPT_SYMBOL="❯" # or $ ❯ ✨ ⚡️
export PURE_GIT_DOWN_ARROW="⇵" # ⇣ ⋌ 👾
export PURE_GIT_UP_ARROW="⇵" # ⇡ ⋋  🚀
export PURE_GIT_STASH_SYMBOL="≡" #  👻
zstyle :prompt:pure:git:branch color black
zstyle :prompt:pure:git:dirty color black
zstyle :prompt:pure:prompt:continuation color black
zstyle :prompt:pure:prompt:success color cyan
prompt pure


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

export PYENV_ROOT="$HOME/.pyenv"
export PYENV_SHELL="zsh"
# To enable shims and autocompletion
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

compinit -i
# eval TWILIO_AC_ZSH_SETUP_PATH=/Users/thomasnagengast/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH; # twilio autocomplete setup
eval $(thefuck --alias)

# export PATH="$HOME/.poetry/bin:$PATH"

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

# bun completions
[ -s "/Users/tomnagengast/.bun/_bun" ] && source "/Users/tomnagengast/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/tomnagengast/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
# eval $(minikube docker-env) # uncomment to enable minikube docker env

# For pyenv: https://stackoverflow.com/questions/50036091/pyenv-zlib-error-on-macos
export LDFLAGS="-L $(xcrun --show-sdk-path)/usr/lib"
export CFLAGS="-L $(xcrun --show-sdk-path)/usr/include -L brew --prefix bzip2/include"

# eksctl completion
fpath+=($fpath ~/.zsh/completion)
