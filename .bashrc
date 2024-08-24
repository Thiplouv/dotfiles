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
PS1="🦔\[\033[0;34m\]-> \[\033[1;36m\]\w \[\033[0;34m\]$\[\033[0m\] "
#
# Reduce current working dir lenght
PROMPT_DIRTRIM=2

# --------------------------------- HOMEBREW -----------------------------------
#
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_ENV_HINTS=1

# --------------------------------- COMPLETION ---------------------------------
#
# Bash
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

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
alias sbash='source ~/.bash_profile'
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
alias vbash='nvim ~/.bash_profile'
alias tocb='xclip -selection clipboard'
alias a='./a.out'

alias pu='brew update && brew upgrade && brew cu -ay'

# --------------------------------- FUNCTIONS ----------------------------------
#
# mkcd
mkcd() {
    mkdir -p "$1"
    cd "$1"
}

# --------------------------------- SOFTWARES ----------------------------------

# Jetbrains Toolbox App
export PATH="$PATH:/Users/thib/Library/Application Support/JetBrains/Toolbox/scripts"

#Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

#Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
