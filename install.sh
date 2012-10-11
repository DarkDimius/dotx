#!/usr/bin/env bash

function install-into-home() {
  if [[ -f "$HOME/$2" ]]; then mv "$HOME/$2" "$HOME/$2.bak"; fi
  ln -s "$(dirname $0)/$1" "$HOME/$2"
}

install-into-home .gitconfig .gitconfig
install-into-home gitignore .gitignore
install-into-home .scala_autorun .scala_autorun
install-into-home .scala_history .scala_history
install-into-home .zshrc .zshrc