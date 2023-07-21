# Shortcuts
alias rsh="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll='ls -alF'
alias s="subl"
alias vim="nvim"
alias h="history | tail -n 50"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias df="vim $HOME/.dotfiles"
alias dfa="vim $HOME/.dotfiles/aliases.zsh"
alias dfz="vim $HOME/.dotfiles/zshrc.zsh"

# Directories
alias work="cd $HOME/code/replicatedhq/data"
alias me="cd $HOME/code/tnagengast"

# dbt
alias dre="../etc/get-dbt-state.py && dbt build -s state:modified"
alias drefresh="dbt run-operation clone_schema && dre"
alias dl="dbt ls -s state:modified"
alias dr="dbt run -s state:modified"
alias drm="dbt run -s"
alias db="dbt build -s state:modified"
alias dbf="dbt build -s state:modified --full-refresh"
alias dbm="dbt build -s"
alias dbmf="dbt build --full-refresh -s"
alias dt="dbt test -m state:modified"
alias dtm="dbt test"
alias drt="dr && dt"
alias 2xl="DBT_PROFILE_WAREHOUSE=transforming_2xl"
alias lr="./dbt_lookml/run.py"

# GitHub
alias mg="git merge origin main"
alias prep="git reset origin/main"
alias npr="cpsc && gh pr create --web --label 'type::feature' -F ~/code/replicatedhq/__templates/dbt_pr.md"
alias cpb="git branch | sed -n -e 's/^\* \(.*\)/\1/p' | pbcopy"
alias lpr="cat ~/code/replicatedhq/__templates/dbt_pr.md | pbcopy"
alias runs="gh run watch -R replicatedhq/\$(basename \$(git remote get-url origin) .git)"
alias wipp="wip && push"

# Snowflake
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
alias snf=snowsql

# Laravel
alias art="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"

# Git
alias clean-local-branches='git branch | grep -v "main" | xargs git branch -D'
alias amend="git add -A && git commit --amend --no-edit"
alias ga="git add -A && git commit -m"
alias nah="git clean -df && git reset --hard"
alias oops="git reset --soft HEAD~1"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias unstage="git restore --staged ."
alias wip="ga wip"
alias aye="git checkout"
alias gl="glo"
alias gs="gss"
alias gr="git recent -n 5"

# Housekeeping
# Enable aliases to be sudo’ed
alias sudo='sudo '

# Utilities
alias cleands="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanbak="find . -type f -name '*.bak' -ls -delete"
alias cleanup="cleands && cleanbak"
alias week='date +%V'
alias localip="ipconfig getifaddr en0"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias path='echo -e ${PATH//:/\\n}'
alias ec2="ssh -i ~/.ssh/aws/data-team.pem ubuntu@ec2-35-86-236-3.us-west-2.compute.amazonaws.com"
alias ec="ssh -i ~/.ssh/aws/data-team.pem"
alias ec20="ssh -i ~/.ssh/aws/data-team.pem ubuntu@18.237.193.74"
alias ec21="ssh -i ~/.ssh/aws/data-team.pem ubuntu@34.222.72.219"
alias ec22="ssh -i ~/.ssh/aws/data-team.pem ubuntu@35.90.177.245"

