#!/usr/bin/env bash
set -o errexit

function install-into-home() {
  if [[ -L "$HOME/$2" ]]; then
    echo "$HOME/$2 already installed"
    return 0;
  fi
  if [[ -f "$HOME/$2" ]]; then mv -v "$HOME/$2" "$HOME/$2.bak"; fi
  ln -s -v "$(realpath $(dirname $0))/$1" "$HOME/$2"
}

install-into-home .gitconfig .gitconfig
install-into-home gitignore .gitignore
install-into-home .scala_autorun .scala_autorun
install-into-home .scala_history .scala_history
install-into-home .zshrc .zshrc
install-into-home .slate .slate