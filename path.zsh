# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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
export PATH="$PATH:/usr/local/opt/mysql-client/bin"

# added by Snowflake SnowSQL installer v1.2
export PATH="$PATH:/Applications/SnowSQL.app/Contents/MacOS"

# Load google-cloud-sdk config
export CLOUDSDK_PYTHON="$(brew --prefix)/opt/python@3.8/libexec/bin/python"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

export DBT_ARTIFACT_STATE_PATH=target/prod/
export DBT_DEFER_TO_STATE=false
