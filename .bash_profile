eval $(thefuck --alias)

export PYTHONPATH="/usr/local/lib/python2.7/site-packages"

alias ll='ls -laG'
alias l='ls -la'

alias gd='git diff'
alias gdc='git diff --cached'
alias gp='git push origin HEAD'
alias gi="git"
alias rm_containers="docker rm $(docker ps -a | rev | cut -d" " -f1 | rev | grep -v NAMES)"
