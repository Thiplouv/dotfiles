#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ------------------------------- OS SPECIFIC ----------------------------------
#
# MacOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export HOMEBREW_NO_ENV_HINTS=1
    export BASH_SILENCE_DEPRECATION_WARNING=1

    # Brew bash completion
    [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

    # Clipboard management
    alias copy='pbcopy'

    # Update aliases
    command -v brew >/dev/null &&
        alias pu='brew update && brew upgrade && brew cu -ay'
fi

# Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Intel graphics
    [ $(lspci | grep -qi 'intel' && echo 1 || echo 0) -eq 1 ] &&
        export LIBVA_DRIVER_NAME=iHD &&
        export VDPAU_DRIVER=va_gl

    # Brightness management
    alias brightness='xrandr --output eDP-1 --brightness'

    # Clipboard management
    alias copy='xclip -selection clipboard'

    # US International quick switch
    alias us='setxkbmap -layout us -variant intl'

    # Archlinux update aliases
    command -v yay >/dev/null &&
        alias pi='yay --needed -S' &&
        alias pu='yay --needed -Syu' &&
        alias pr='yay -Rcn'

    # Ubuntu update aliases
    command -v apt >/dev/null &&
        alias pi='sudo apt install' &&
        alias pu='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y' &&
        alias pr='sudo apt autoremove'
fi

# ------------------------------- PATH -----------------------------------------
#
# PATH User Settings
# NOTE: PATH is first populated by /etc/profile and /etc/profile.d/

# Imported from /etc/profile
append_path() {
    case ":$PATH:" in
    *:"$1":*) ;;
    *)
        PATH="${PATH:+$PATH:}$1"
        ;;
    esac
}

# ~/.local/bin/
append_path "$HOME/.local/bin"

# /usr/local/bin/
append_path "/usr/local/bin"

# --------------------------------- SHELL CONFIG -------------------------------
#
# Pager and editor
export VISUAL=nvim
export EDITOR=nvim
export PAGER="less"
export MANPAGER="sh -c 'col -bx | bat --theme=base16-2 -l man -p'"
export MANROFFOPT="-c"

# XDG variables (from Arch wiki)
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Prompt Customisation
#PS1="🦔\[\033[0;34m\]-> \[\033[1;36m\]\w \[\033[0;34m\]$\[\033[0m\] "
#PROMPT_DIRTRIM=2

eval "$(starship init bash)"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# History
export HISTFILE=~/.history
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

# --------------------------------- ALIASES ------------------------------------
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

# Others
alias vi='nvim'
alias vbash='nvim ~/.bashrc'
alias w='watch -tn 1 '
alias diff='diff --color=auto'
alias imgcat='wezterm imgcat'

# --------------------------------- FUNCTIONS ----------------------------------
#
# mkcd
mkcd() {
    mkdir -p "$1"
    cd "$1"
}

# --------------------------------- SOFTWARES ----------------------------------
#
# Doas
command -v doas >/dev/null &&
    alias sudo='doas' &&
    alias sudoedit='doas rnano' &&
    complete -cf doas

# GDB
command -v gdb >/dev/null &&
    alias gdb='gdb -q'

# Jetbrains Toolbox App
[[ -d $XDG_DATA_HOME/JetBrains/Toolbox ]] &&
    append_path "$XDG_DATA_HOME/JetBrains/Toolbox/scripts"

#Pyenv
[[ -d $HOME/.pyenv ]] && export PYENV_ROOT="$HOME/.pyenv" &&
    [[ -d $PYENV_ROOT/bin ]] && append_path "$PYENV_ROOT/bin" &&
    eval "$(pyenv init -)"

#NVM
# Install manually via the script provided in the readme
[[ -d $HOME/.nvm ]] && export NVM_DIR="$HOME/.nvm" &&
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Ripgrep
command -v rg >/dev/null &&
    alias grep='rg' &&
    export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# FZF
which fzf >/dev/null 2>&1 &&
    eval "$(fzf --bash)" &&
    export FZF_COLORS=" \
        --color=bg+:#484f58,bg:-1,spinner:#f85149,hl:#d2a8ff \
        --color=fg:#c9d1d9,header:#f0883e,info:#a5d6ff,pointer:#f85149 \
        --color=marker:#7ee787,fg+:#c9d1d9,prompt:#79c0ff,hl+:#d2a8ff \
        --color=selected-bg:#30363d \
        --multi --no-bold " &&
    export FZF_DEFAULT_OPTS="$FZF_COLORS" &&
    export FZF_CTRL_T_OPTS="
        --walker-skip .git,node_modules,target
        --preview 'bat -n --color=always --line-range=:250 {}'
        --bind 'ctrl-/:change-preview-window(down|hidden|)'"

#Jenv
command -v jenv >/dev/null &&
    eval "$(jenv init -)"

# Orbstack
[[ -d $HOME/.orbstack/ ]] && source $HOME/.orbstack/shell/init.bash 2>/dev/null || :

# Exegol
command -v exegol >/dev/null &&
    alias exegol='sudo -E $(which exegol)'

# Rust (via rustup)
[[ -d $HOME/.cargo/bin/ ]] && append_path "$HOME/.cargo/bin/"

# ----------------------------------- IMPORTS ----------------------------------
#
# BWI
[[ -r $HOME/.bwirc ]] && source $HOME/.bwirc

# EPITA
[[ -r $HOME/.epitarc ]] && source $HOME/.epitarc

# ------------------------------------- EOF ------------------------------------
# Imported from /etc/profile
unset -f append_path
