#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ----------------------------------- IMPORTS ----------------------------------
#
# BWI
[[ -r ~/.bwirc ]] && . ~/.bwirc

# EPITA
[[ -r ~/.epitarc ]] && . ~/.epitarc

# --------------------------------- SHELL CONFIG -------------------------------
#
# Prompt Customisation
PS1="🐗\[\033[0;34m\]-> \[\033[1;36m\]\w \[\033[0;34m\]$\[\033[0m\] "
PROMPT_DIRTRIM=2

# colorize ls
[ -x /usr/bin/dircolors ] && eval "$(dircolors -b)"

# Colorize MAN Pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Pager and editor
export PAGER="/bin/less"
export EDITOR=nvim

# Video hardware accel
export LIBVA_DRIVER_NAME=iHD
export VDPAU_DRIVER=va_gl

# Startup programs
pfetch

# ---------------------------------- COMPLETION --------------------------------
#
# Doas
complete -cf doas

# --------------------------------- ALIASES -----------------------------------
#
# LS
alias ll='lsd -lhF --color=auto --oneline --group-dirs first'
alias la='lsd -lhFA --color=auto --oneline --group-dirs first'
alias tree='lsd --tree'

# CAT & LESS
export BAT_THEME="github-dark-hc"
command -v bat >/dev/null &&
    alias cat='bat --style=header-filename,header-filesize,rule,snip' &&
    alias batcat='bat --pager=never' &&
    alias less='bat'

# Sourcing
alias sbash='source ~/.bashrc'
alias sv='source ./.venv/bin/activate'

# Package manager
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

# Doas
alias sudo='doas'
alias sudoedit='doas rnano'

# Others
alias w='watch -tn 1 '
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias vi='nvim'
alias vbash='nvim ~/.bashrc'
alias tocb='xclip -selection clipboard'
alias gdb='gdb -q'
alias icat='kitten icat'
alias brightness='xrandr --output eDP-1 --brightness'

# --------------------------------- FUNCTIONS ----------------------------------
#
# MKCD
mkcd() {
    mkdir -p "$1"
    cd "$1"
}

# --------------------------------- SOFTWARES ----------------------------------
#
# Jetbrains Toolbox App
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# NVM
source /usr/share/nvm/init-nvm.sh

# Ranger configuration loading
export RANGER_LOAD_DEFAULT_RC=false
