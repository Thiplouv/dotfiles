#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --------------------------------- SHELL CONFIG -------------------------------
# Sets vi editing mode
# set -o vi

# Pager and editor
export VISUAL=nvim
export EDITOR=nvim
export PAGER="bat -p --paging=always"
export MANPAGER="sh -c 'col -bx | bat --theme=base16-2 -l man -p'"
export MANROFFOPT="-c"

# XDG related
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Prompt Customisation
# PS1="🐗\[\033[0;34m\]-> \[\033[1;36m\]\w \[\033[0;34m\]$\[\033[0m\] "
# PROMPT_DIRTRIM=2

eval "$(starship init bash)"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# Video hardware accel
export LIBVA_DRIVER_NAME=iHD
export VDPAU_DRIVER=va_gl

# ---------------------------------- COMPLETION --------------------------------
#
# Doas
complete -cf doas

# --------------------------------- ALIASES -----------------------------------
#
# LS
command -v lsd >/dev/null &&
    alias ls="lsd" &&
    alias tree='lsd --tree'

alias ll='ls -lhF'
alias la='ls -lhFA'

# CAT & LESS
command -v bat >/dev/null &&
    alias cat='bat' &&
    alias less='bat -p --paging=always'

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
alias master='git checkout master'
alias gc='git commit'
alias gb='git branch'
alias gp='git push'
alias gpf='git push -f'
alias gpt='git push --follow-tags'
alias gpr='git pull --rebase'
alias gst='git stash push -m'

# Doas
command -v doas >/dev/null &&
    alias sudo='doas' &&
    alias sudoedit='doas rnano'

# Others
alias vi='nvim'
alias vbash='nvim ~/.bashrc'
alias w='watch -tn 1 '
alias grep='rg'
alias diff='diff --color=auto'
alias copy='xclip -selection clipboard'
alias gdb='gdb -q'
alias imgcat='wezterm imgcat'
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

# Ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# FZF
eval "$(fzf --bash)"
export FZF_COLORS=" \
--color=bg+:#484f58,bg:-1,spinner:#f85149,hl:#d2a8ff \
--color=fg:#c9d1d9,header:#f0883e,info:#a5d6ff,pointer:#f85149 \
--color=marker:#7ee787,fg+:#c9d1d9,prompt:#79c0ff,hl+:#d2a8ff \
--color=selected-bg:#30363d \
--multi --no-bold "
export FZF_DEFAULT_OPTS="$FZF_COLORS"
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always --line-range=:250 {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# ----------------------------------- IMPORTS ----------------------------------
#
# BWI
[[ -r ~/.bwirc ]] && . ~/.bwirc

# EPITA
[[ -r ~/.epitarc ]] && . ~/.epitarc
