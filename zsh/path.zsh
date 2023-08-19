export PATH=/opt/homebrew/bin:$PATH

# Use project specific binaries before global ones
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"

# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:vendor/bin"

# Node
export PATH="$PATH:$HOME/.node/bin"
export PATH="$PATH:node_modules/.bin"

# Bun
export PATH="$PATH:$BUN_INSTALL/bin"

# pyenv
export PATH="$(pyenv root)/shims:$PATH"
export PATH="$PATH:$PYENV_ROOT/bin"

# Rust
export PATH="$PATH:$HOME/.cargo/env"

# Applications

# Herd
export PATH="/Users/tomnagengast/Library/Application Support/Herd/bin/":$PATH

# Snowflake
export PATH="$PATH:/Applications/SnowSQL.app/Contents/MacOS"
export PATH="$PATH:/Applications/Sublime Text.app/Contents/SharedSupport/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# dbt
export DBT_STATE=target/prod/
export DBT_DEFER=true
export DBT_CLOUD_ACCOUNT_ID=
export DBT_CLOUD_PROJECT_ID=
