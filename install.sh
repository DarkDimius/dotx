#!/usr/bin/env bash

function install-into-destination() {
  dest=$1
  from=$2
  to=$3
  if [[ -z "$to" ]]; then to=$from; fi

  if [[ -L "$dest/$to" ]]; then
    echo "$dest/$to already installed"
    return 0;
  fi
  if [[ -f "$dest/$to" ]]; then mv -v "$dest/$to" "$dest/$to.bak"; fi
  ln -s -v "$(realpath $(dirname $0))/$from" "$dest/$to"
}

function install-into-home() {
  install-into-destination "$HOME" $1 $2
}

function install-into-bin() {
  install-into-destination "/usr/local/bin" $1 $2
}

function install-into-etc() {
  install-into-destination "/etc" $1 $2
}

function install-into-daemons() {
  name=$1
  from="$(realpath $(dirname $0))/$name.plist"
  to="/Library/LaunchDaemons/$name.plist"

  if [[ -f "$to" ]]; then
    echo "$to already installed"
    return 0;
  else
    cp -v "$from" "$to"
    launchctl load "$to"
    launchctl start local.$name
  fi
}

install-into-home .gitconfig
install-into-home gitignore .gitignore
install-into-home .scala_autorun
install-into-home .scala_history
install-into-home .bashrc
install-into-home .bash_profile
install-into-home .slate
install-into-home .inputrc
install-into-home git-completion.bash .git-completion.bash

install-into-bin git-pull-request.py
install-into-bin java6
install-into-bin java7
install-into-bin java8
install-into-bin launch-iterm-with-cwd.applescript
install-into-bin skype-menubar-updater
install-into-bin jenkins-track
install-into-bin jenkins-daemon
install-into-bin jenkins-submit

install-into-etc launchd.conf
install-into-etc paths

install-into-daemons by.xeno.dotx_backup
install-into-daemons by.xeno.jenkins_daemon

if [[ ! -d "/usr/local/sbt" ]]; then
  git clone https://github.com/paulp/sbt-extras /usr/local/sbt
  ln -sv /usr/local/sbt/sbt /usr/local/bin/sbt
fi