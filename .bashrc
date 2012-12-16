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

# environment variables have been moved to launchd.conf

source $(brew --prefix)/etc/bash_completion
source $HOME/.git-completion.bash
source $HOME/.hack-completion.bash
source $HOME/.partest-completion.bash
export PYTHONSTARTUP=/Users/xeno_by/.pystartup

function parse_git_branch {
  ref=$(git rev-parse --abbrev-ref HEAD 2> /dev/null) || return
  echo " ("${ref#refs/heads/}")"
}
PS1="\$(date +%H:%M) \w\$(parse_git_branch)\$ "

alias gch='git checkout'
alias gco='git commit'
alias gcoa='git commit --amend'
alias gca='git commit --amend'
alias gb='git branch'
alias gbD='git branch -D'
alias gn='git checkout -b'
function gci { git push origin $(git rev-parse --abbrev-ref HEAD); }
function gci+ { git push origin +$(git rev-parse --abbrev-ref HEAD); }
alias gpo='git pull origin'
alias gpu='git pull upstream'
alias gs='git status'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grbs='git rebase --skip'
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'
alias gra='git remote add'
alias grv='git remote -v'
alias gru='git remote update'
alias grn='git remote rename'
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

source "$HOME/Projects/Libscala/libscala.sh"
alias gl='git --no-pager log --pretty=oneline -20'
alias j="jenkins-submit"
alias js="jenkins-scan"
alias pr="pullrequest"
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

alias ez='subl $HOME/Projects/Dotx/.bashrc'
alias az='source $HOME/.bash_profile'
alias hm='cd "$HOME"'
alias ubi='cd "/usr/local/bin"'
alias db='cd "/media/XENO/Dropbox"'
alias dl='cd "$HOME/Downloads"'
alias prj='cd "$HOME/Projects"'
alias ide='cd "$HOME/Projects/ScalaIDE"'
alias ens='cd "$HOME/Projects/Ensime"'
alias sens='cd "$HOME/Library/Application Support/Sublime Text 2/Packages/Ensime"'
alias des='cd "$HOME/Library/Application Support/Sublime Text 2"'
alias pap='cd "$HOME/Projects/Pages"'
alias dotx='cd "$HOME/Projects/Dotx"'
function kep { target="$(hack-home)"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb { target="$(hack-home)/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }

function bug6685 {
  sb6685
  TOOLCP29=.:$SCALA292/lib/scala-compiler.jar:$SCALA292/lib/scala-library.jar
  BUILD=/Users/xeno_by/Projects/Kepler_6685/build
  TOOLCP210=$BUILD/asm/classes:/Users/xeno_by/Projects/Kepler_6685/build/quick/classes/library:$BUILD/quick/classes/reflect:$BUILD/quick/classes/compiler
  if [[ $# == 0 ]]; then
    java -classpath $TOOLCP29 C $TOOLCP210 ArrayUser.scala
  else
    java -classpath $TOOLCP29 C $TOOLCP210 ArrayUser.scala "$*"
  fi
}
alias b=bug6685

### Automatically managed part of .bashrc
### Don't write anything below this comment, or it might get accidentally destroyed
function keptypemacros { target="$(hack-home "typemacros")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbtypemacros { target="$(hack-home "typemacros")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep210x { target="$(hack-home "2.10.x")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb210x { target="$(hack-home "2.10.x")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function keppre-typemacros { target="$(hack-home "pre-typemacros")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbpre-typemacros { target="$(hack-home "pre-typemacros")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepshowraw { target="$(hack-home "showraw")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbshowraw { target="$(hack-home "showraw")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function keptoplevel { target="$(hack-home "toplevel")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbtoplevel { target="$(hack-home "toplevel")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepsnippet00 { target="$(hack-home "snippet00")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbsnippet00 { target="$(hack-home "snippet00")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep6685 { target="$(hack-home "6685")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6685 { target="$(hack-home "6685")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepunchecked-pattern-match { target="$(hack-home "unchecked-pattern-match")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbunchecked-pattern-match { target="$(hack-home "unchecked-pattern-match")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepmacrosnippet00 { target="$(hack-home "macrosnippet00")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbmacrosnippet00 { target="$(hack-home "macrosnippet00")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep6187 { target="$(hack-home "6187")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6187 { target="$(hack-home "6187")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepsnippet01 { target="$(hack-home "snippet01")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbsnippet01 { target="$(hack-home "snippet01")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep6742 { target="$(hack-home "6742")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6742 { target="$(hack-home "6742")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepsnippet02 { target="$(hack-home "snippet02")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbsnippet02 { target="$(hack-home "snippet02")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepsnippet03 { target="$(hack-home "snippet03")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbsnippet03 { target="$(hack-home "snippet03")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepmacrosnippet01 { target="$(hack-home "macrosnippet01")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbmacrosnippet01 { target="$(hack-home "macrosnippet01")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep6751 { target="$(hack-home "6751")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6751 { target="$(hack-home "6751")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepunapply-macros { target="$(hack-home "unapply-macros")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbunapply-macros { target="$(hack-home "unapply-macros")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepsnippet04 { target="$(hack-home "snippet04")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbsnippet04 { target="$(hack-home "snippet04")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep5467 { target="$(hack-home "5467")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb5467 { target="$(hack-home "5467")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepidempotency { target="$(hack-home "idempotency")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbidempotency { target="$(hack-home "idempotency")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep5875 { target="$(hack-home "5875")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb5875 { target="$(hack-home "5875")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep6696 { target="$(hack-home "6696")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6696 { target="$(hack-home "6696")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep6548 { target="$(hack-home "6548")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6548 { target="$(hack-home "6548")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepsnippet05 { target="$(hack-home "snippet05")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbsnippet05 { target="$(hack-home "snippet05")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepmacrosnippet02 { target="$(hack-home "macrosnippet02")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbmacrosnippet02 { target="$(hack-home "macrosnippet02")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepsuper-call-args { target="$(hack-home "super-call-args")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbsuper-call-args { target="$(hack-home "super-call-args")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function keptypeof { target="$(hack-home "typeof")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbtypeof { target="$(hack-home "typeof")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep4044 { target="$(hack-home "4044")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb4044 { target="$(hack-home "4044")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep5841 { target="$(hack-home "5841")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb5841 { target="$(hack-home "5841")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepannotated { target="$(hack-home "annotated")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbannotated { target="$(hack-home "annotated")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepshowrawpos { target="$(hack-home "showrawpos")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbshowrawpos { target="$(hack-home "showrawpos")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep6808 { target="$(hack-home "6808")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6808 { target="$(hack-home "6808")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepident-deprecation-warnings { target="$(hack-home "ident-deprecation-warnings")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbident-deprecation-warnings { target="$(hack-home "ident-deprecation-warnings")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function keptyped-ident-attachments { target="$(hack-home "typed-ident-attachments")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbtyped-ident-attachments { target="$(hack-home "typed-ident-attachments")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepannotation-error { target="$(hack-home "annotation-error")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbannotation-error { target="$(hack-home "annotation-error")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepquasiquotes { target="$(hack-home "quasiquotes")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbquasiquotes { target="$(hack-home "quasiquotes")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"