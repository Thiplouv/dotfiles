#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --------------------------------- SSH AGENT -----------------------------------

# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
#     source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi

# ---------------------------------- COMPLETION -------------------------------

source <(kubectl completion $(basename $SHELL))

# --------------------------------- ALIASES -----------------------------------

# LS
alias l='lsd -lhF --color=auto --oneline --group-dirs first'
alias la='lsd -lhFA --color=auto --oneline --group-dirs first'
alias tree='lsd --tree'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias v='nvim'
alias cc='gcc -Wall -Wextra -Werror --pedantic -std=c99'

# Sourcing
alias sbash='source ~/.bashrc'
alias sdef='source ~/.scw_default'
alias sdev='source ~/.scw_dev'


# Pacman & Yay
alias p='yay --needed -S'
alias pu='yay --needed -Syu'

# Git
alias gs='git status'
alias gl='git log --oneline'
alias gcm='git checkout master'

### CAT & LESS
command -v bat > /dev/null && \
        alias bat='bat --style=header-filename,header-filesize,rule,snip' && \
        alias cat='bat --pager=never' && \
        alias less='bat'

# K8S
alias k='kubectl'
complete -F __start_kubectl k


# MKCD
mkcd () {
  mkdir -p "$1"
  cd "$1"
}

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

# EDITOR
export EDITOR=nvim

# Reduce current working dir lenght
PROMPT_DIRTRIM=2

# Prompt Customisation
PS1="\[\033[1;35m\]\u\[\033[0;34m\] | \[\033[1;36m\]\w >\[\033[1;34m\]>\[\033[0m\] "

# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=bash)"

# Node Version Manager
source /usr/share/nvm/init-nvm.sh

# Poetry Path
export PATH="/home/tplouviez/.local/bin:$PATH"

