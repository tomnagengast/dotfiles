# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Load Sublime Text bin for `subl command
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Load google-cloud-sdk config
export CLOUDSDK_PYTHON="$(brew --prefix)/opt/python@3.8/libexec/bin/python"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

export DBT_ARTIFACT_STATE_PATH=target/prod/
export DBT_DEFER_TO_STATE=false
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
