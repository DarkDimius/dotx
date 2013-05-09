# http://stackoverflow.com/questions/68372/what-is-your-single-most-favorite-command-line-trick-using-bash
# http://serverfault.com/questions/337123/strange-bash-history-behaviour-when-running-multiple-sessions
shopt -s cmdhist
shopt -s histappend
# http://superuser.com/questions/7414/how-can-i-search-the-bash-history-and-rerun-a-command
shopt -s histverify
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTIGNORE="&:ls:exit"
export HISTCONTROL="erasedups:ignoreboth"
if [[ "$TERM" != "dumb" ]]; then stty stop ""; fi
export PROMPT_COMMAND='history -a' # http://users.livejournal.com/_winnie/371322.html
export HISTTIMEFORMAT='%F %T ' # http://www.thegeekstuff.com/2008/08/15-examples-to-master-linux-command-line-history/

# environment variables have been moved to launchd.conf

source $(brew --prefix)/etc/bash_completion
source $HOME/.git-completion.bash
source $HOME/.hack-completion.bash
source $HOME/.partest-completion.bash
source $HOME/.grade-completion.bash
export PYTHONSTARTUP=/Users/xeno_by/.pystartup

function parse_git_branch {
  ref=$(git rev-parse --abbrev-ref HEAD 2> /dev/null) || return
  echo " ("${ref#refs/heads/}")"
}
PS1="\$(date +%H:%M) \w\$(parse_git_branch)\$ "

function git {
  export LANG=C
  export LC_ALL=en_US.UTF-8
  /usr/local/bin/git $*
}
alias ga='git add'
alias gai='git add -i'
alias gap='git add -p'
alias gaa='git add -A $(git rev-parse --show-toplevel 2>/dev/null)'
alias gr='git remove'
alias gch='git checkout'
alias gco='git commit'
alias gcoa='git commit --amend'
alias gca='git commit --amend'
alias gb='git branch'
alias gba='git branch -a'
alias gbD='git branch -D'
alias gn='git checkout -b'
function gci { git push origin $(git rev-parse --abbrev-ref HEAD); }
function gci+ { git push origin +$(git rev-parse --abbrev-ref HEAD); }
function gpo { git pull origin $(git rev-parse --abbrev-ref HEAD); }
function gpu { git pull upstream $(git rev-parse --abbrev-ref HEAD); }
alias gs='git status'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbi1='git rebase -i HEAD~1'
alias grbi2='git rebase -i HEAD~2'
alias grbi3='git rebase -i HEAD~3'
alias grbi4='git rebase -i HEAD~4'
alias grbi5='git rebase -i HEAD~5'
alias grbi10='git rebase -i HEAD~10'
alias grbi20='git rebase -i HEAD~20'
alias grbi100='git rebase -i HEAD~100'
alias grbc='gaa && git rebase --continue'
alias grba='git rebase --abort'
alias grbs='git rebase --skip'
alias gcp='git cherry-pick'
alias gcpc='gaa && git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'
alias gra='git remote add'
alias grv='git remote -v'
alias gru='git remote update'
alias gl='git --no-pager log --pretty=oneline -20'
alias grh='git reset --hard'
alias grh0='git reset --hard HEAD'
alias grh1='git reset --hard HEAD~1'
alias grh2='git reset --hard HEAD~2'
alias grh3='git reset --hard HEAD~3'
alias grh4='git reset --hard HEAD~4'
alias grh5='git reset --hard HEAD~5'
alias grh100='git reset --hard HEAD~100'
alias grm='git reset --mixed'
alias grm0='git reset --mixed HEAD'
alias grm1='git reset --mixed HEAD~1'
alias grm2='git reset --mixed HEAD~2'
alias grm3='git reset --mixed HEAD~3'
alias grm4='git reset --mixed HEAD~4'
alias grm5='git reset --mixed HEAD~5'
alias gm='git merge'
alias gma='git merge --abort'
complete -F _git_branch gm grb grbi gch gb gbD
alias cl='git-ls-merge-conflicts'
alias cr='subl-conflicts'

source "$HOME/Projects/Libscala/libscala.sh"
alias gl='git --no-pager log --pretty=oneline -20'
alias j="jenkins-submit"
alias n="python -c 'import webbrowser; webbrowser.open("'"'"https://scala-webapps.epfl.ch/jenkins/view/misc/job/macro-paradise-nightly-main/buildWithParameters?publish=true"'"'")'"
alias js="jenkins-scan"
alias pr="/usr/local/bin/pullrequest"
alias t="partest"
alias tmacro="partest-macro --macros-only"
alias treify="partest-macro --macros-and-reify"
alias ta="partest --all"
alias td="partest-diff"
alias td1="partest-diff 1"
alias td2="partest-diff 2"
alias td3="partest-diff 3"
alias td4="partest-diff 4"
alias td5="partest-diff 5"
alias td6="partest-diff 6"
alias td7="partest-diff 7"
alias td8="partest-diff 8"
alias td9="partest-diff 9"
alias td10="partest-diff 10"
alias td11="partest-diff 11"
alias td12="partest-diff 12"
alias td13="partest-diff 13"
alias td14="partest-diff 14"
alias td15="partest-diff 15"
alias td16="partest-diff 16"
alias td17="partest-diff 17"
alias td18="partest-diff 18"
alias td19="partest-diff 19"
alias td20="partest-diff 20"
alias td21="partest-diff 21"
alias td22="partest-diff 22"
alias td23="partest-diff 23"
alias td24="partest-diff 24"
alias td25="partest-diff 25"
alias td26="partest-diff 26"
alias td27="partest-diff 27"
alias td28="partest-diff 28"
alias td29="partest-diff 29"
alias tv="partest-suite --view-with-numbers"
alias tv1="partest-file --edit 1"
alias tv2="partest-file --edit 2"
alias tv3="partest-file --edit 3"
alias tv4="partest-file --edit 4"
alias tv5="partest-file --edit 5"
alias tv6="partest-file --edit 6"
alias tv7="partest-file --edit 7"
alias tv8="partest-file --edit 8"
alias tv9="partest-file --edit 9"
alias tv10="partest-file --edit 10"
alias tv11="partest-file --edit 11"
alias tv12="partest-file --edit 12"
alias tv13="partest-file --edit 13"
alias tv14="partest-file --edit 14"
alias tv15="partest-file --edit 15"
alias tv16="partest-file --edit 16"
alias tv17="partest-file --edit 17"
alias tv18="partest-file --edit 18"
alias tv19="partest-file --edit 19"
alias tv20="partest-file --edit 20"
alias tv21="partest-file --edit 21"
alias tv22="partest-file --edit 22"
alias tv23="partest-file --edit 23"
alias tv24="partest-file --edit 24"
alias tv25="partest-file --edit 25"
alias tv26="partest-file --edit 26"
alias tv27="partest-file --edit 27"
alias tv28="partest-file --edit 28"
alias tv29="partest-file --edit 29"
alias te1="partest-file --export 1"
alias te2="partest-file --export 2"
alias te3="partest-file --export 3"
alias te4="partest-file --export 4"
alias te5="partest-file --export 5"
alias te6="partest-file --export 6"
alias te7="partest-file --export 7"
alias te8="partest-file --export 8"
alias te9="partest-file --export 9"
alias te10="partest-file --export 10"
alias te11="partest-file --export 11"
alias te12="partest-file --export 12"
alias te13="partest-file --export 13"
alias te14="partest-file --export 14"
alias te15="partest-file --export 15"
alias te16="partest-file --export 16"
alias te17="partest-file --export 17"
alias te18="partest-file --export 18"
alias te19="partest-file --export 19"
alias te20="partest-file --export 20"
alias te21="partest-file --export 21"
alias te22="partest-file --export 22"
alias te23="partest-file --export 23"
alias te24="partest-file --export 24"
alias te25="partest-file --export 25"
alias te26="partest-file --export 26"
alias te27="partest-file --export 27"
alias te28="partest-file --export 28"
alias te29="partest-file --export 29"
alias h="hack"
alias hh="hack-homes --all"
complete -F _hack h
complete -F _hack_homes hh
alias gc="gaika compile"
alias sbtsnap="sbt -sbt-snapshot"
alias rmc="rm-classfiles"
alias s="rmc && scalac *Test*.scala"
alias sli="rmc && scalac *Test*.scala -Xlog-implicits"
alias sp="rmc && scalac *Test*.scala -Xprint:parser"
alias st="rmc && scalac *Test*.scala -Xprint:typer"
alias sy="rmc && scalac *Test*.scala -Ymacro-debug-lite"
alias sty="rmc && scalac *Test*.scala -Ytyper-debug"
alias siy="rmc && scalac *Test*.scala -Yinfer-debug"
alias syy="rmc && scalac *Test*.scala -Ymacro-debug-verbose"
alias sm="rmc && scalac *Macros*.scala"
alias ss="rmc && scalac *Macros*.scala && scalac Test*.scala"
alias ssli="rmc && scalac *Macros*.scala && scalac Test*.scala -Xlog-implicits"
alias ssp="rmc && scalac *Macros*.scala && scalac Test*.scala -Xprint:parser"
alias sst="rmc && scalac *Macros*.scala && scalac Test*.scala -Xprint:typer"
alias ssy="rmc && scalac *Macros*.scala && scalac Test*.scala -Ymacro-debug-lite"
alias ssty="rmc && scalac *Macros*.scala && scalac Test*.scala -Ytyper-debug"
alias ssiy="rmc && scalac *Macros*.scala && scalac Test*.scala -Yinfer-debug"
alias ssyy="rmc && scalac *Macros*.scala && scalac Test*.scala -Ymacro-debug-verbose"
alias r="scala Test"
alias sr="rmc && scalac *Test*.scala && scala Test"
alias ssr="rmc && scalac *Macros*.scala && scalac *Test*.scala && scala Test"
alias my="acc && sbt 'run ../examples/my.l3'"
alias sus="sync-upstream"

alias ez='subl $HOME/Projects/Dotx/.bashrc'
alias az='source $HOME/.bash_profile'
alias acc='cd "$HOME/Projects/ACC/l3/compiler"'
alias hm='cd "$HOME"'
alias ubi='cd "/usr/local/bin"'
alias db='cd "/Users/Shared/Dropbox/Public"'
alias dl='cd "$HOME/Downloads"'
alias prj='cd "$HOME/Projects"'
alias ide='cd "$HOME/Projects/ScalaIDE"'
alias ens='cd "$HOME/Projects/Ensime"'
alias plugins='cd "$HOME/.sbt/0.12.1/plugins"'
alias cf='cd "$HOME/Projects/codefest2013"'
alias sens='cd "$HOME/Library/Application Support/Sublime Text 2/Packages/Ensime"'
alias des='cd "$HOME/Library/Application Support/Sublime Text 2"'
alias sens2='cd "$HOME/Library/Application Support/Sublime Text 2/Packages/Ensime"'
alias des2='cd "$HOME/Library/Application Support/Sublime Text 2"'
alias sens3='cd "$HOME/Library/Application Support/Sublime Text 3/Packages/Ensime"'
alias des3='cd "$HOME/Library/Application Support/Sublime Text 3"'
alias stock3='cd "/Applications/Sublime Text 3.app/Contents/MacOS/Packages"'
alias pap='cd "$HOME/Projects/Pages"'
alias slang='cd "$HOME/Projects/ScalaLang"'
alias dotx='cd "$HOME/Projects/Dotx"'
alias docs='cd "$HOME/Projects/DocsScalaLang"'
alias smock='cd "$HOME/Projects/ScalaMock"'
alias gr='cd "$HOME/Projects/pp-2012-simulation-grades"'
alias ssrc='cd "$HOME/Scratchpad/ScalaSrc"'
alias slick='cd "$HOME/Projects/Slick"'
alias shared='cd "$HOME/../Shared/VirtualBox"'
alias spick='cd "$HOME/Projects/scala-pickling"'
alias sspick='cd "$HOME/Projects/Paradise210"'
function kep { target="$(hack-home)"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb { cd sandbox; }
function master { target="$(hack-home "master")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbmaster { target="$(hack-home "master")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function 210x { target="$(hack-home "2.10.x")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb210x { target="$(hack-home "2.10.x")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function paradise { target="$(hack-home "paradise/macros")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbparadise { target="$(hack-home "paradise/macros")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function paradise210 { target="$(hack-home "paradise/macros210")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbparadise210 { target="$(hack-home "paradise/macros210")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function pullrequest { target="$(hack-home "pullrequest/paradise")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbpullrequest { target="$(hack-home "pullrequest/paradise")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function backport { target="$(hack-home "backport/paradise")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbbackport { target="$(hack-home "backport/paradise")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }

### Automatically managed part of .bashrc
### Don't write anything below this comment, or it might get accidentally destroyed
function kep6240 { target="$(hack-home "6240")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6240 { target="$(hack-home "6240")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep6411 { target="$(hack-home "6411")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6411 { target="$(hack-home "6411")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepruntime-internal { target="$(hack-home "runtime-internal")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbruntime-internal { target="$(hack-home "runtime-internal")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepintroduce-member { target="$(hack-home "introduce-member")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbintroduce-member { target="$(hack-home "introduce-member")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepresetattrs-this { target="$(hack-home "resetattrs-this")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbresetattrs-this { target="$(hack-home "resetattrs-this")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7148 { target="$(hack-home "7148")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7148 { target="$(hack-home "7148")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7112-followup { target="$(hack-home "7112-followup")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7112-followup { target="$(hack-home "7112-followup")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepdefaultnamed { target="$(hack-home "defaultnamed")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbdefaultnamed { target="$(hack-home "defaultnamed")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepmacrojit { target="$(hack-home "macrojit")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbmacrojit { target="$(hack-home "macrojit")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7190 { target="$(hack-home "7190")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7190 { target="$(hack-home "7190")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepmacro-annotations { target="$(hack-home "macro-annotations")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbmacro-annotations { target="$(hack-home "macro-annotations")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepsnippet00 { target="$(hack-home "snippet00")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbsnippet00 { target="$(hack-home "snippet00")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep6725 { target="$(hack-home "6725")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6725 { target="$(hack-home "6725")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7235 { target="$(hack-home "7235")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7235 { target="$(hack-home "7235")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
function kep7240 { target="$(hack-home "7240")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7240 { target="$(hack-home "7240")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepsnippet01 { target="$(hack-home "snippet01")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbsnippet01 { target="$(hack-home "snippet01")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7251 { target="$(hack-home "7251")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7251 { target="$(hack-home "7251")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepshannon-entropy { target="$(hack-home "shannon-entropy")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbshannon-entropy { target="$(hack-home "shannon-entropy")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepmacro-trace { target="$(hack-home "macro-trace")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbmacro-trace { target="$(hack-home "macro-trace")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7276 { target="$(hack-home "7276")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7276 { target="$(hack-home "7276")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7271 { target="$(hack-home "7271")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7271 { target="$(hack-home "7271")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepsilence-the-log { target="$(hack-home "silence-the-log")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbsilence-the-log { target="$(hack-home "silence-the-log")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7320 { target="$(hack-home "7320")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7320 { target="$(hack-home "7320")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepsplice-error-message { target="$(hack-home "splice-error-message")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbsplice-error-message { target="$(hack-home "splice-error-message")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7331 { target="$(hack-home "7331")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7331 { target="$(hack-home "7331")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7334 { target="$(hack-home "7334")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7334 { target="$(hack-home "7334")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7325 { target="$(hack-home "7325")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7325 { target="$(hack-home "7325")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep5923 { target="$(hack-home "5923")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb5923 { target="$(hack-home "5923")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep5353 { target="$(hack-home "5353")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb5353 { target="$(hack-home "5353")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepmacro-qqq { target="$(hack-home "macro-qqq")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbmacro-qqq { target="$(hack-home "macro-qqq")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep6937 { target="$(hack-home "6937")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6937 { target="$(hack-home "6937")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepiso { target="$(hack-home "iso")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbiso { target="$(hack-home "iso")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep7464 { target="$(hack-home "7464")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb7464 { target="$(hack-home "7464")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }