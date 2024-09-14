#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ------------------------------- OS SPECIFIC ----------------------------------
#
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export HOMEBREW_NO_ENV_HINTS=1

    # For some reason this is needed:
    export PATH="/usr/local/bin:$PATH"

    # Brew bash completion
    [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

    # Updates
    alias pu='brew update && brew upgrade && brew cu -ay'
fi

# --------------------------------- SHELL CONFIG -------------------------------
# Pager and editor
export EDITOR=nvim

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

# --------------------------------- ALIASES ------------------------------------
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
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias vi='nvim'
alias vbash='nvim ~/.bashrc'
alias tocb='xclip -selection clipboard'
alias a='./a.out'

# --------------------------------- FUNCTIONS ----------------------------------
#
# mkcd
mkcd() {
    mkdir -p "$1"
    cd "$1"
}

# --------------------------------- SOFTWARES ----------------------------------
#
# Jetbrains Toolbox App
export PATH="$PATH:$XDG_DATA_HOME/JetBrains/Toolbox/scripts"

#Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#NVM
# Install manually via the script provided in the readme
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# ----------------------------------- IMPORTS ----------------------------------
#
# BWI
[[ -r $HOME/.bwirc ]] && . $HOME/.bwirc

# EPITA
[[ -r $HOME/.epitarc ]] && . $HOME/.epitarc
