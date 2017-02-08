#!/bin/sh

# Mac profile
export PYTHONPATH="/usr/local/lib/python2.7/site-packages"

eval $(thefuck --alias)

# clear for mac
alias clear='/usr/bin/osascript -e "tell application \"System Events\" to tell process \"Terminal\" to keystroke \"k\" using command down"'

# ls aliases
alias ll='ls -laG'
alias l='ls -la'

# git aliases
alias gd='git diff'
alias gdc='git diff --cached'
alias gp='git push origin HEAD'
alias gi='git'

function clone(){
  git clone git@github.com:$1.git $2 --recursive;
  if [[ -z "$2" ]]; then
    cd $1
  else
    cd $2
  fi
}
export -f clone

# docker helpers
rm_containers() {
  for i in $(docker ps -a -q)
  do
    docker rm $i -f
  done
}
rm_images() {
  docker rmi $(docker images -q)
}
export -f rm_containers
export -f rm_images

# set title for iterm2 bash window
function title {
  echo -ne "\033]0;"$*"\007"
}

kp() {
  kill $(lsof -i :$1 -t)
}
export -f kp

tag() {
  git tag | sort | grep -v v | tail -1
}
export -f tag

alias shrug='echo "¯\_(ツ)_/¯"'
