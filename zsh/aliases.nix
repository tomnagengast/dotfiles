{
  # SSH
  gogogo = "ssh -i ~/.ssh/replit -p 22 5dbe8df1-a623-4cc2-a30e-c954e2114be0@5dbe8df1-a623-4cc2-a30e-c954e2114be0-00-20lqwhdcc1630.kirk.replit.dev";

  # Navigation
  ".." = "cd ..";
  "..." = "cd ../..";
  "...." = "cd ../../..";
  df = "vim $HOME/dotfiles";
  dfa = "vim $HOME/dotfiles/aliases.zsh";
  dfz = "vim $HOME/dotfiles/zshrc.zsh";

  reloaddns = "dscacheutil -flushcache && sudo killall -HUP mDNSResponder";
  l = "ls -1A --group-directories-first";
  ll = "ls -1Al --header --group-directories-first";
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

  sf = "sqlfmt && sqlfluff fix";
  ss = "sqlfmt && sqlfluff lint";
  tf = "terraform";

  # Airflow
  comd = "composer-dev";

  # GitHub
  npr = "gh pr create --web";
  cpb = "git branch | sed -n -e 's/^\\* \\(.*\\)/\\1/p' | pbcopy";
  lpr = "cat ~/code/replicatedhq/__templates/dbt_pr.md | pbcopy";
  runs = "gh run watch -R $(git remote get-url origin | sed -E 's|.*github\\.com[:/](.+/[^/]+)\\.git|\\1|') .git)";

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
  path = "echo -e ${PATH//:/\\n}";
}
