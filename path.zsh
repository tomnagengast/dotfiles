export DBT_ARTIFACT_STATE_PATH=target/prod/
export DBT_DEFER_TO_STATE=true
export DBT_CLOUD_ACCOUNT_ID=26191
export DBT_CLOUD_PROJECT_ID=163465
# export DBT_CLOUD_API_KEY="" # set it .gitignored file

export PATH=/opt/homebrew/bin:$PATH

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"

# Load Composer tools
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Load Node global installed binaries
export PATH="$PATH:$HOME/.node/bin"
export PATH="$PATH:$HOME/.dotfiles/scripts"

# Load Sublime Text bin for `subl command
export PATH="$PATH:/Applications/Sublime Text.app/Contents/SharedSupport/bin"

# Use project specific binaries before global ones
export PATH="$PATH:node_modules/.bin:vendor/bin"
export PATH="$PATH:/usr/local/sbin"

# pyenv
export PATH="$(pyenv root)/shims:$PATH"
export PATH="$PATH:$PYENV_ROOT/bin"

# added by Snowflake SnowSQL installer v1.2
export PATH="$PATH:/Applications/SnowSQL.app/Contents/MacOS"

export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export PATH="$HOME/Developer/replicatedhq/data/bin:$PATH"

export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/env:$PATH"

# Deno
export DENO_INSTALL="/Users/tomnagengast/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
# export PATH="$PATH:/usr/local/opt/mysql-client/bin"
