#!/bin/sh
# Profile for Mac

export PYTHONPATH="/usr/local/lib/python2.7/site-packages"

### list aliases
alias ll='ls -laG'
alias l='ls -la'

### git aliases
alias gd='git diff'
alias gdc='git diff --cached'
alias gp='git push origin HEAD'

tag() {
  git tag | sort | grep -v v | tail -1
}
export -f tag

clone() {
  git clone git@github.com:$1.git $2 --recursive;
  if [[ -z "$2" ]]; then
    cd $1
  else
    cd $2
  fi
}
export -f clone

### docker helpers
rm_containers() {
  for i in $(docker ps -a -q)
  do
    docker rm $i -f
  done
}
export -f rm_containers

rm_images() {
  docker rmi $(docker images -q)
}
export -f rm_images

### misc ###
# set title for iterm2 bash window
title() {
  echo -ne "\033]0;"$*"\007"
}
export -f title

kp() {
  kill $(lsof -i :$1 -t)
}
export -f kp

flushdns() {
  sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;
}
export -f flushdns

# clear for mac
alias clear='/usr/bin/osascript -e "tell application \"System Events\" to tell process \"Terminal\" to keystroke \"k\" using command down"'

alias shrug='echo "¯\_(ツ)_/¯"'
