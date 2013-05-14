grep-src() { fgrep "$1" * -r $2 $3 $4 --exclude=*\.log ; }

# makes git grep wrap long lines instead of cutting them short
export LESS=FRX
# cancels out bash-it customization that makes ls output directories in cyan instead of blue
export LSCOLORS=''

BREW_PREFIX=`brew --prefix`

alias .g='source ~/.bash_profile'
alias a='activate'
alias bi='bundle install --path vendor/bundle'
alias tbi='time bundle install --path vendor/bundle'
alias be='bundle exec'
alias tbe='time bundle exec'
alias c='clear'
alias diskspace='du -k | grep -v '\''./.*\/'\'''
alias dos2unix='perl -npe '\''s/\x0D/\x0A/g'\'' '
alias ds='du -k  | grep -v "\/.*\/"'

alias ll='ls -lF'
alias lla='ls -alF'
alias l='ls -F'
alias la='ls -FA'

alias lr='ls -alrt'
alias dir='ls -lF'

alias linecount='awk '\''{a+=$1}END{print a}'\'''
alias r='rails'
alias sc='script/console'
alias sm='smultron'
alias ss='script/server'
alias hh='history -d $(($HISTCMD-2)) && history -d $(($HISTCMD-1))' # remove previous line from history
alias gvim="mvim --remote-send '<C-w>n'; mvim --remote-silent"
alias vmf="set -o vi; export EDITOR=vim; echo 'bind -v' > ~/.editrc; echo 'set editing-mode vi' > ~/.inputrc"
alias dvmf="set -o emacs; unset EDITOR; rm ~/.editrc; rm ~/.inputrc"
alias mcurl="curl --write-out \"\nhttp-code: %{http_code}, content-type: '%{content_type}', total time: %{time_total}, app connect time: %{time_appconnect}, pretransfer time: %{time_pretransfer}, starttransfer time: %{time_starttransfer}\n\""
alias gems-kill='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias gems-clean='gems-kill && gem install bundler -v 1.1.5 && gem install rake pivotal_git_scripts'
alias ctags="$BREW_PREFIX/bin/ctags"
alias isp='echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"'

if [[ -d "$HOME/bin" ]]; then
  export PATH=$HOME/bin:$PATH
fi
