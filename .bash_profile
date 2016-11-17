# Mac profile
export PYTHONPATH="/usr/local/lib/python2.7/site-packages"

eval $(thefuck --alias)

# ls aliases
alias ll='ls -laG'
alias l='ls -la'

# git aliases
alias gd='git diff'
alias gdc='git diff --cached'
alias gp='git push origin HEAD'
alias gi="git"

# docker aliases
alias rm_containers="docker rm $(docker ps -a | rev | cut -d" " -f1 | rev | grep -v NAMES) -f"
alias rm_images="docker rmi $(docker images -q)"

alias shrug='echo "¯\_(ツ)_/¯"'

# set title for iterm2 bash window
function title {
  echo -ne "\033]0;"$*"\007"
}
