#
# ~/.bashrc for Thiplouv's personal use
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# HW VIDEO ACCEL
export LIBVA_DRIVER_NAME=iHD
export VDPAU_DRIVER=va_gl

# ---------------------------------- COMPLETION -------------------------------

source <(kubectl completion $(basename $SHELL))
complete -F __start_kubectl k
complete -cf doas

# --------------------------------- ALIASES -----------------------------------

# LS
alias ll='lsd -lhF --color=auto --oneline --group-dirs first'
alias la='lsd -lhFA --color=auto --oneline --group-dirs first'
alias tree='lsd --tree'

# Sourcing
alias sbash='source ~/.bashrc'
alias sv='source ./.venv/bin/activate'

# Pacman & Yay
alias pi='yay --needed -S'
alias pu='yay --needed -Syu'
alias pr='yay -Rcns'

# Git
alias gs='git status'
alias gl='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --all'
alias gcm='git checkout master'
alias gcom='git commit -m'
alias gb='git branch'
alias gp='git push'
alias gpf='git push -f'
alias gpt='git push --follow-tags'
alias gpr='git pull --rebase'
alias grm='git rebase master'
alias gst='git stash push -m'

### CAT & LESS
command -v bat > /dev/null && \
        alias bat='bat --style=header-filename,header-filesize,rule,snip' && \
        alias batcat='bat --pager=never' && \
        alias less='bat'

# K8S
alias k='kubectl'
alias kda='kubectl delete all --all'
alias kds='kubectl delete secrets --all'
alias kl='kubectl logs -f'

# Doas
alias sudo='doas'
alias sudoedit='doas rnano'

# Connect to AFS (EPITA)
alias kafs='kinit -f thibault.plouviez@CRI.EPITA.FR'
alias sshafs='sshfs -o reconnect thibault.plouviez@ssh.cri.epita.fr:/afs/cri.epita.fr/user/t/th/thibault.plouviez/u/ afs'

# Others
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias vi='nvim'
alias vbash='nvim ~/.bashrc'
alias tocb='xclip -selection clipboard'
alias a='./a.out'
alias gdb='gdb -q'
alias vg='colour-valgrind'
alias cf='clang-format -i'
alias sqf='sqlfluff fix'
alias brightness='xrandr --output eDP-1 --brightness'

# Binary Ninja
alias bn='/home/thibault-plouviez/binaryninja/binaryninja'

# MKCD
mkcd () {
  mkdir -p "$1"
  cd "$1"
}

# Add C Exercise
addexc () {
    mkdir -p "$1";
    touch "$1/$1.c";
    cp default_header.h "$1/$1.h"
    cp default_Makefile "$1/Makefile";
    cp default_testsuite.c "$1/testsuite.c";
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

#export PAGER="/usr/bin/less -R"

# EDITOR
export EDITOR=nvim

# Reduce current working dir lenght
PROMPT_DIRTRIM=2

# Prompt Customisation
PS1="🦔\[\033[0;34m\]-> \[\033[1;36m\]\w \[\033[0;34m\]$\[\033[0m\] "

export PATH="/home/thibault-plouviez/.local/share/JetBrains/Toolbox/scripts:$PATH"

# Node Version Manager
source /usr/share/nvm/init-nvm.sh

# Pyenv
eval "$(pyenv init -)"
