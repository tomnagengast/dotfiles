# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias rsh="source $HOME/.zshrc"
alias df="subl $HOME/.dotfiles"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app'
alias pycharm='open -a /Applications/PyCharm.app'
alias webstorm='open -a /Applications/WebStorm\ 2022.2\ EAP.app'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias s="subl"
alias wwc="npx cypress run --record --key a1ca458e-835e-4a2b-b4d1-fb125c1abc2d"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias df="code ~/.dotfiles"

# Directories
alias library="cd $HOME/Library"
alias work="cd $HOME/Developer/replicatedhq"
alias sites="cd $HOME/Sites"

# dbt
alias dbt_reset="dbt clean && dbt deps && ../scripts/get_dbt_prod_artifacts.sh && dbt ls -s state:modified" # --resource-type model
alias dl="dbt ls -s state:modified"
alias dr="dbt run -s state:modified"
alias drm="dbt run -s"
alias db="dbt build -s state:modified"
alias dbf="dbt build -s state:modified --full-refresh"
alias dbm="dbt build -s"
alias dt="dbt test -m state:modified"
alias dtm="dbt test"
alias drt="dr && dt"
alias 2xl="DBT_PROFILE_WAREHOUSE=transforming_2xl"

# GitHub
alias mg="git merge origin main"
alias prep="git reset origin/main"
alias npr="cpsc && gh pr create --web --label 'type::feature' -F ~/Developer/replicatedhq/__templates/dbt_pr.md"
alias lpr="cat ~/Developer/replicatedhq/__templates/looker_pr.md | pbcopy"
alias runs="gh run watch -R replicatedhq/\$(basename \$(git remote get-url origin) .git)"
alias wipp="wip && push"

# Python
# alias newpython="LDFLAGS="-L$(xcrun --show-sdk-path)/usr/lib" pyenv install" #  3.8.6
alias newpython="arch -arm64 pyenv install" #  3.11-dev; this work more consistently than the above
# alias python="/usr/local/bin/python3"
# alias pip="/usr/local/bin/pip3"

# Sourcegraph
# alias sourcegraph-start="docker run \
#     --publish 7080:7080 \
#     --publish 127.0.0.1:3370:3370 --rm \
#     --volume ~/.sourcegraph/config:/etc/sourcegraph \
#     --volume ~/.sourcegraph/data:/var/opt/sourcegraph:delegated \
#     sourcegraph/server:3.27.4"

# Snowflake
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
alias snf=/Applications/SnowSQL.app/Contents/MacOS/snowsql

# Databricks
alias dbx="databricks"
alias cp_dbx="mkd tmp; databricks workspace export_dir / ."

# Laravel
alias art="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"
alias pu="phpunit"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="php -d memory_limit=-1 /usr/local/bin/composer"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# Git
alias clear-local-branches='git branch | grep -v "master" | xargs git branch -D'
alias amend="git add . && git commit --amend --no-edit"
alias branches="git branches"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nah="git clean -df && git reset --hard"
alias oops="git reset --soft HEAD~1"
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
alias gr="git recent -n 3"
alias ng="git init && git commit -m 'Initial commit' --allow-empty && git branch -m master main"

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

# K8s
alias k="kubectl"
alias kg="kubectl get"
alias dash="kubectl get deployments,svc,pod"
alias kwp="watch -d 'kubectl get pods -o wide'"

# Terraform
alias tf="terraform"

# Homebrew
alias brew="arch -arm64 brew"

# Act
alias actl="act --container-architecture linux/amd64"

alias get_viddy="suod -i && wget -O viddy.tar.gz https://github.com/sachaos/viddy/releases/download/v0.3.6/viddy_0.3.6_Linux_x86_64.tar.gz && tar xvf viddy.tar.gz && mv viddy /usr/bin"
