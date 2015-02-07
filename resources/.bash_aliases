# Alias
# =====
alias ll='ls -l'
alias la='ls -la'
alias lk='ls -lah|grep "\->" 2>/dev/null || echo "no symlinked files here..."'
alias lh='ls .???* 2> /dev/null || echo "no hidden files here..."'
alias li='ls -ai'
alias lt='ls -ltr|tail -10'
alias l=40'ls -ltr|tail -40'
alias lli='ls -lai'
alias lsd='ls -l|grep "^d"'

alias h='history'
alias hl='history|less'
alias ht='history|tail -10'
alias h40='history|tail -40'
alias hl='history|less'

alias hgrep='history|grep'
alias alg='alias|grep'

alias c='clear'
alias s='cd ..'
alias q='exit'

alias vi="vim"
alias vb='vi ~/.bashrc'
alias sb='source ~/.bashrc'

alias rmf='rm -rf'

alias saru30='sar -u|head -3 ; sar -u|tail -30'
alias sarq30='sar -q|head -3 ; sar -q|tail -30'

alias path='echo $PATH'


# Functions
# =========

function mkd() {
  mkdir -p "$@" && cd "$_";
}
