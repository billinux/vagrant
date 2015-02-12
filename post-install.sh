#! /usr/bin/env bash

chown -R vagrant:root /usr/local

# Post install
# ------------
echo "### Post-install"

# APT
# ---
echo "## APT"
# Configure
# ---------
echo "# Configure..."
cat > /etc/apt/sources.list <<EOF
deb http://ftp.fr.debian.org/debian/ wheezy main non-free contrib
deb-src http://ftp.fr.debian.org/debian/ wheezy main non-free contrib

deb http://security.debian.org/ wheezy/updates main contrib non-free
deb-src http://security.debian.org/ wheezy/updates main contrib non-free

# wheezy-updates, previously known as 'volatile'
deb http://ftp.fr.debian.org/debian/ wheezy-updates main contrib non-free
deb-src http://ftp.fr.debian.org/debian/ wheezy-updates main contrib non-free

# Opscode
# apt-get install opscode-keyring
deb http://apt.opscode.com/ wheezy-0.10 main

# Dotdeb
# wget http://www.dotdeb.org/dotdeb.gpg
# sudo apt-key add dotdeb.gpg
deb http://packages.dotdeb.org wheezy-php56 all
deb-src http://packages.dotdeb.org wheezy-php56 all

# Percona-server
#deb http://repo.percona.com/apt wheezy main
#deb-src http://repo.percona.com/apt wheezy main

# MariaDB
#apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
#deb http://nwps.ws/pub/mariadb/repo/10.0/debian wheezy main
#deb-src http://nwps.ws/pub/mariadb/repo/10.0/debian wheezy main

deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/debian wheezy main
deb-src http://ftp.osuosl.org/pub/mariadb/repo/10.0/debian wheezy main

#deb http://download.nus.edu.sg/mirror/mariadb/repo/10.0/ubuntu trusty main
#deb-src http://download.nus.edu.sg/mirror/mariadb/repo/10.0/ubuntu trusty main
EOF

# APT-Recommends
# --------------
cat > /etc/apt/apt.conf.d/10norecommends <<EOF
APT::Install-Recommends "0";
EOF

# APT-Suggests
# ------------
cat > /etc/apt/apt.conf.d/10nosuggests <<EOF
APT::Install-Suggests "0";
EOF

# APT-Keyring
# -----------
echo "# Install Apt keyring..."
apt-get install opscode-keyring
wget http://www.dotdeb.org/dotdeb.gpg
apt-key add dotdeb.gpg
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db

# APT-Update
# ----------
echo "# Update package list..."
aptitude update

# APT-Upgrade
# -----------
echo "# Upgrade installed packages..."
aptitude -y safe-upgrade

# APT-Install usefull packages
# ----------------------------
echo "# Install a few useful packages..."
aptitude -y install sudo screen inetutils-telnet ntpdate bsd-mailx logrotate multitail tcpdump nmap lsof ssmtp bind9-host atop htop iptraf psmisc less mlocate mtr python rsync unzip dnsutils whois cron-apt geoip-database  openssh-server file lockfile-progs openssh-blacklist openssh-blacklist-extra logwatch

# Bash config
# -----------
echo "## Bash config"

# For vagrant
# -----------

# Git clone
# -----------
echo "# For 'vagrant'"
git clone --depth 1 https://github.com/twolfson/sexy-bash-prompt.git /usr/local/src/bash/sexy-bash-prompt
ln -sfn /usr/local/src/bash/sexy-bash-prompt/.bash_prompt /home/vagrant/.bash_prompt

git clone git://github.com/trapd00r/LS_COLORS.git /usr/local/src/dircolors/LS_COLORS
ln -sfn /usr/local/src/dircolors/dircolors-solarized/dircolors.ansi-light /home/vagrant/.dircolors

# Rbenv
# -----
git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
/home/vagrant/.rbenv/bin/rbenv init
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
/home/vagrant/.rbenv/plugins/ruby-build/install.sh
chmod +x /home/vagrant/.rbenv/completions/rbenv.bash && ~/.rbenv/completions/rbenv.bash

# Bashrc
# ------
cat > /home/vagrant/.bashrc <<EOF
#clear
export INS="/home/vagrant/install.sh"

# OS
# ==
[ $(uname -s) = "Darwin" ] && export OSX=1 && export UNIX=1
[ $(uname -s) = "Linux" ] && export LINUX=1 && export UNIX=1
uname -s | grep -q "_NT-" && export WINDOWS=1

# Terminal
# ========
#export TERM="xterm-256color"
export TERM="linux"

# Colors
# ======
if [ -x /usr/bin/tput ] && tput setaf 1 > /dev/null; then
  tput sgr0
  bold=$(tput bold)
  reset=$(tput sgr0)

  black=$(tput setaf 0)
  red=$(tput setaf 1)
  green=$(tput setaf 2)
  yellow=$(tput setaf 3)
  blue=$(tput setaf 4)
  purple=$(tput setaf 5)
  cyan=$(tput setaf 6)
  light_gray=$(tput setaf 7)

  dark_gray=${bold}${black}
  light_red=${bold}${red}
  light_green=${bold}${green}
  light_yellow=${bold}${yellow}
  light_blue=${bold}${blue}
  light_purple=${bold}${purple}
  light_cyan=${bold}${cyan}
  white=${bold}${light_gray}

else

  bold=""
  reset="\e[0m"

  black="\e[30m"
  red="\e[31m"
  green="\e[32m"
  yellow="\e[33m"
  blue="\e[34m"
  purple="\e[35m"
  cyan="\e[36m"
  light_gray="\e[37m"

  dark_gray="\e[1;30m"
  light_red="\e[1;31m"
  light_green="\e[1;32m"
  light_yellow="\e[1;33m"
  light_blue="\e[1;34m"
  light_purple="\e[1;35m"
  light_cyan="\e[1;36m"
  white="\e[1;37m"
fi

# Settings
# ========
# Brackets
export bo="[ "
export bc=" ]"

export bold reset black red green yellow blue purple cyan white
export dark_gray light_red light_green light_yellow light_blue light_purple light_cyan light_gray

# PATH
# ====
# Rbenv must be FIRST
export PATH="/home/vagrant/.rbenv/bin:$PATH"
export PATH="$PATH:/usr/sbin:/sbin"
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

# Sourced files
# =============
# Bash aliases
BASH_ALIASES=$HOME/.bash_aliases
if [ -f $BASH_ALIASES ]; then
    . $BASH_ALIASES
fi

# Editor
# ======
if  type vim > /dev/null 2>&1 ; then
  export EDITOR="vim"
fi

# Pager
# =====
if  type most > /dev/null 2>&1 ; then
  export PAGER="most"
fi

# Rbenv
# =====
eval "$(rbenv init -)"

# z
# =
. /usr/local/src/z/z.sh

# Debian Chroot
# =============
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# Fancy color prompt
# ==================
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=""
  fi
fi

# Non-login shell
# ===============
case $- in
    *i*) ;;
      *) return;;
esac

# History settings
# ================
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE=$HISTSIZE
shopt -s histappend

# Shopt variables
# ===============
# Update the values of LINES and COLUMNS
# after each command
shopt -s checkwinsize

# Match /path/to/**/folder
shopt -s globstar

# Less
# ====
# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Colors
# ======
# Color support of ls and handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Competion
# =========
# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Bash git Prompt
# ===============

# Default prompt
# =-=-=-=-=-=-=-
PS1="\u@\h :\w $ "

# Bash git prompt
# =-=-=-=-=-=-=-=

# Configuration
# -------------
# Git prompt configuration
#GIT_PROMPT_ONLY_IN_REPO=1
#GIT_PROMPT_THEME=Solarized

BASH_GIT_PROMPT=$HOME/.bash-git-prompt/gitprompt.sh
#if [ -f $BASH_GIT_PROMPT ]; then
#  . $BASH_GIT_PROMPT
#fi

# Run twolfson/sexy-bash-prompt
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Colors
# ------
if [ $UID = "0" ]; then
  PROMPT_USER_COLOR="${light_red}"
  PROMPT_DIR_COLOR="${light_red}"
else
  PROMPT_USER_COLOR="${light_green}"
  PROMPT_DIR_COLOR="${light_green}"
fi
PROMPT_PREPOSITION_COLOR="${white}"
PROMPT_DEVICE_COLOR="${light_yellow}"
PROMPT_GIT_STATUS_COLOR="${light_cyan}"
PROMPT_GIT_PROGRESS_COLOR="${light_purple}"
PROMPT_SYMBOL_COLOR="${white}"

# Symbols
# -------
PROMPT_SYNCED_SYMBOL=""
PROMPT_DIRTY_SYNCED_SYMBOL="*"
PROMPT_UNPUSHED_SYMBOL="↑"
PROMPT_DIRTY_UNPUSHED_SYMBOL="*↑"
PROMPT_UNPULLED_SYMBOL="↓"
PROMPT_DIRTY_UNPULLED_SYMBOL="*↓"
PROMPT_UNPUSHED_UNPULLED_SYMBOL="*↑↓"
PROMPT_DIRTY_UNPUSHED_UNPULLED_SYMBOL="*↑↓"

BASH_PROMPT=$HOME/.bash_prompt
if [ -f $BASH_PROMPT ]; then
  . $BASH_PROMPT
fi
EOF

# Bash aliases
# ------------
cat > /home/vagrant/.bash_aliases <<EOF

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
EOF

# Vimrc
# -----
cat > /home/vagrant/.vimrc <<EOF
" Init"{{{
" ====
if !1 | finish | endif

" Shell have to display $()
let g:is_posix=1
set nocompatible
filetype plugin off
"}}}
" Mapleader"{{{
" =========
let mapleader=','
"}}}
" Helpers"{{{
" =======
function! s:create_dir(path)
  if !isdirectory(a:path)
    call mkdir(a:path, 'p')
  endif
endfunction
"}}}
" Colors"{{{
" ======
set background=dark
"set t_Co=256
"let base16colorspace=256

"if &t_Co < 256
"  try
"    let base16colorspace=256
"    colorscheme base16-monokai
"  catch
"    colorscheme default
"  endtry
"else
"  try
"    let base16colorspace=256
"    colorscheme molokai
"  catch
"    colorscheme desert
"  endtry
"endif
"}}}
" Encoding"{{{
" ========
scriptencoding utf-8
set termencoding=utf-8
set fileencoding=utf-8
"}}}
" Formatting"{{{
" ==========
set autoindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set shiftround
set expandtab
set textwidth=0
set smarttab
set fileformats=unix,dos,mac
set formatoptions-=r
set formatoptions-=o

vnoremap < <gv
vnoremap > >gv
"}}}
" Search"{{{
" ======
set confirm
set ignorecase
set infercase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set matchtime=2
set matchpairs+=<:>

nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap s/ s/\v
noremap <silent> <leader><space> :set hlsearch! hlsearch?<cr>
"}}}
" Shell"{{{
" =====
set shell=sh
"}}}
" Display"{{{
" =======
set backspace=indent,eol,start
set hidden
set ttyfast
set showcmd
set ruler
set laststatus=2
set modeline modelines=5

set number numberwidth=3
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set number
    set relativenumber
  endif
endfunction
nnoremap <leader>; :call NumberToggle()<cr>
"}}}
" Backup, undo, swap, view"{{{
" ========================
set nobackup undofile undoreload=1000 noswapfile
set undodir=$HOME/.cache/.vim/.cache/undo

let undo_dir=expand('~/.cache/.vim/.cache/undo')
if !isdirectory(undo_dir)
  silent call s:create_dir(undo_dir)
endif
"}}}
" list"{{{
" ====
set list
set listchars=tab:>\
set listchars+=eol:$
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
set listchars+=nbsp:+
noremap <leader>l :set list! list?<cr>
"}}}
"Errors"{{{
"======
set noerrorbells
set novisualbell
set timeoutlen=500
set t_vb=
"}}}
" Wildmenu"{{{
" ========
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn,*.o,*.out,*~
""}}}
" Folding"{{{
" =======
function! NeatFoldText()"{{{
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
"}}}
set foldenable
set foldmethod=marker
set foldlevelstart=0
"}}}
" Windows"{{{
" =======
set splitbelow
set splitright
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"}}}
" PasteToggle"{{{
" ===========
map ;; :set invpaste<cr>:set paste?<cr>
map <leader>, :set invpaste<cr>:set paste?<cr>
"}}}
" Mappings"{{{
" ========
inoremap jj <esc>
inoremap jk <esc>
inoremap kk <esc>
inoremap hh <esc>
inoremap jk <esc>

noremap <leader>q :qa!<cr>
noremap Y y$

nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<cr>
nnoremap <down> :bprev<cr>
nnoremap <up> :bnext<cr>
nnoremap <left> :tabnext<cr>
nnoremap <right> :tabprev<cr>
"}}}
" Omnicompletion"{{{
" ==============
set omnifunc=syntaxcomplete#Complete
"}}}
" AutoCommands"{{{
" ============
augroup VIMRC
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos ("'\""))
augroup END
"}}}
" Bundles"{{{
" =======
let iCanHazNeoBundle=1
let NeoBundle_readme=expand('~/.cache/.vim/neobundle/neobundle.vim/README.md')
if !filereadable(NeoBundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.cache/.vim/neobundle
  silent !mkdir -p ~/.cache/.vim/.cache/undo
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.cache/.vim/neobundle/neobundle.vim
  let iCanHazNeoBundle=0
endif

if has('vim_starting')
  set runtimepath+=~/.cache/.vim/neobundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.cache/.vim/neobundle/'))

" NeoBundles
" ----------
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build': {
  \      'linux' : 'make',
  \      'unix'  : 'gmake'
  \    }
  \}

NeoBundle 'chriskempson/base16-vim'


filetype plugin indent on
syntax enable

if iCanHazNeoBundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :NeoBundleInstall
endif

call neobundle#end()
:NeoBundleCheck
"}}}

"Vim: set ft=vim sw=2 ts=2 sts=2 ff=unix fenc=utf-8:
EOF

# For root
# --------
echo "# For 'root'"
rm -f /root/.bashrc
ln -sfn /home/vagrant/.bashrc /root/.bashrc
ln -sfn /home/vagrant/.bash_aliases /root/.bash_aliases
ln -sfn /home/vagrant/.dircolors /root/.dircolors
ln -sfn /home/vagrant/.vimrc /root/.vimrc
ln -sfn /usr/local/src/bash/sexy-bash-prompt/.bash_prompt /root/.bash_prompt
