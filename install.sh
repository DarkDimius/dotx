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

function install-into-agents() {
  name=$1
  from="$(realpath $(dirname $0))/$name.plist"
  to="/Library/LaunchAgents/$name.plist"

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
install-into-home .scala_ignore_crashes
install-into-home .bashrc
install-into-home .bash_profile
install-into-home .slate
install-into-home .inputrc
install-into-home .pystartup
install-into-home git-completion.bash .git-completion.bash
install-into-home .pullrequest
install-into-home .jenkins
install-into-home ..hack .hack
install-into-home ..hackproto .hackproto
install-into-home hack-completion.bash .hack-completion.bash
install-into-home hack.sublime-project .hack.sublime-project
install-into-home hack.alfredextension .hack.alfredextension
install-into-home partest-completion.bash .partest-completion.bash
install-into-home grade-completion.bash .grade-completion.bash
install-into-home .scala_tier

install-into-bin pullrequest
install-into-bin java6
install-into-bin java7
install-into-bin java8
install-into-bin switch-java
install-into-bin launch-iterm-with-cwd
install-into-bin skype
install-into-bin skype-menubar-updater
install-into-bin jenkins-callback
install-into-bin jenkins-scan
install-into-bin jenkins-submit
install-into-bin jenkins-failures
install-into-bin jenkins-url
install-into-bin scala-root
install-into-bin scala-tier
install-into-bin scala-toolcp
install-into-bin scala-runner scala
install-into-bin scala-runner scalac
install-into-bin scala-runner fsc
install-into-bin scala-runner scaladoc
install-into-bin scala-runner scalap
install-into-bin scala-crash-filter
install-into-bin adhoc-scalac
install-into-bin parse
install-into-bin typecheck
install-into-bin parse-and-typecheck
install-into-bin partest
install-into-bin partest-lookup
install-into-bin partest-diff
install-into-bin partest-suite
install-into-bin partest-create
install-into-bin partest-file
install-into-bin partest-macro
install-into-bin shell
if [[ -f "/usr/local/bin/stree" && ! -L "/usr/local/bin/stree" ]]; then mv "/usr/local/bin/stree" "/usr/local/bin/stock-stree"; fi
install-into-bin stree
install-into-bin bug
install-into-bin bug si
install-into-bin hub-introspect
install-into-bin toggle-notification-center
install-into-bin hack
install-into-bin hack-home
install-into-bin hack-homes
install-into-bin hack-branch
install-into-bin hack-prototype
install-into-bin hack-gc
install-into-bin zzz-commence-hack-gc
install-into-bin zzz-commence-kepler-gc
install-into-bin zzz-commence-kepler-backup
install-into-bin gaika
install-into-bin gitblit
install-into-bin h2
install-into-bin pomodoro-launch-app
install-into-bin pomodoro-pomodoro
install-into-bin pomodoro-shortbreak
install-into-bin pomodoro-longbreak
install-into-bin pomodoro-start
install-into-bin pomodoro-stop
install-into-bin pomodoro-reset
install-into-bin sandbox
install-into-bin deploy-paradise
install-into-bin paradise-prereqs
install-into-bin grade
install-into-bin solution
install-into-bin reeder-launch-app
install-into-bin reeder-focus-unread

install-into-etc launchd.conf
install-into-etc paths

install-into-daemons by.xeno.dotx_backup
install-into-daemons by.xeno.gitblit
install-into-daemons by.xeno.ANT_OPTS
install-into-daemons by.xeno.EDITOR
install-into-agents by.xeno.jenkins_agent

if [[ ! -d "/usr/local/sbt" ]]; then
  git clone https://github.com/paulp/sbt-extras /usr/local/sbt
  ln -sv /usr/local/sbt/sbt /usr/local/bin/sbt
fi