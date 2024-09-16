# The following sources ~/.bashrc in the interactive login case,
# because .bashrc isn't sourced for interactive login shells:
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi ;; esac

# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.bash 2>/dev/null || :
