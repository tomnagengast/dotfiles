# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias rsh="source $HOME/.zshrc"
alias dotfiles="code $HOME/.dotfiles"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias datagrip='open -a /Applications/DataGrip.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Directories
alias library="cd $HOME/Library"
alias work="cd $HOME/Work/"
alias sites="cd $HOME/Sites"

# dbt
alias dbt_refresh="dbt clean; dbt deps; dbt seed"
alias dbt_data_refresh="dbt run-operation stage_external_sources; ../scripts/get_dbt_prod_artifacts.sh"
alias dbt_refresh_all="dbt_refresh; dbt_data_refresh"
alias dr="dbt run -m state:modified"
alias dt="dbt test -m state:modified --exclude test_name:relationships test_name:equal_rowcount"

# Python
alias newpython="LDFLAGS="-L$(xcrun --show-sdk-path)/usr/lib" pyenv install" #  3.8.6
# alias python="/usr/local/bin/python3"
# alias pip="/usr/local/bin/pip3"

# Databricks
alias dbx="databricks"
alias start-infra-dev="databricks clusters start --cluster-id 1206-161743-codex424"
alias check-infra-dev="databricks clusters get --cluster-id 1206-161743-codex424"
alias cp_dbx="mkd tmp; databricks workspace export_dir / ."

# Laravel
alias a="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="php -d memory_limit=-1 /usr/local/bin/composer"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# Git
alias amend="git add . && git commit --amend --no-edit"
alias branches="git branches"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nah="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"
alias gb="git branch"
alias aye="git checkout"
alias gc="git go"
alias gl="glo"
alias gs="gss"
alias ga="commit" # This is trickier to drop than I'd thought...

# Housekeeping

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Recursively delete `.DS_Store` files
alias cleands="find . -type f -name '*.DS_Store' -ls -delete"

# Recursively delete `.bak` files
alias cleanbak="find . -type f -name '*.bak' -ls -delete"

# Recursively delete `.DS_Store` and `.bak` files
alias cleanup="cleands && cleanbak"

# Utilities

# Get week number
alias week='date +%V'

# Get local IP address
alias localip="ipconfig getifaddr en0"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
alias myprs='gh pr list -a tnagengast'
