#clear

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
