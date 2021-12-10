#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --------------------------------- ALIASES -----------------------------------
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias gcc='gcc -Wall -Wextra -Werror --pedantic -std=c99'

### LS & TREE
command -v lsd > /dev/null && alias ls='lsd --group-dirs first'

command -v lsd > /dev/null && alias ls='lsd'

### CAT & LESS
command -v bat > /dev/null && \
        alias bat='bat --theme=ansi' && \
        alias cat='bat --pager=never' && \
        alias less='bat'

# colorize ls
[ -x /usr/bin/dircolors ] && eval "$(dircolors -b)"

# --------- Colorize MAN Pages -----------

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export PAGER="/usr/bin/less -R"


# Reduce current working dir lenght
PROMPT_DIRTRIM=2

# Prompt Customisation
PS1=" 🦔 \[\033[1;35m\]\u\[\033[0;34m\] | \[\033[1;36m\]\w >\[\033[1;34m\]>\[\033[0m\] "
