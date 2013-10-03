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
source $HOME/.subl-open-project-completion.bash
source $HOME/.alfred-completion.bash
export PYTHONSTARTUP=/Users/xeno_by/.pystartup

# cannot put this in launchd.conf because:
# http://stackoverflow.com/questions/12064725/dyld-dyld-environment-variables-being-ignored-because-main-executable-usr-bi
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-5.5/lib
function sudo {
  local backup=$DYLD_LIBRARY_PATH
  unset DYLD_LIBRARY_PATH
  /usr/bin/sudo "$@"
  export DYLD_LIBRARY_PATH=$backup
}
function ps {
  local backup=$DYLD_LIBRARY_PATH
  unset DYLD_LIBRARY_PATH
  /bin/ps "$@"
  export DYLD_LIBRARY_PATH=$backup
}

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
alias git='git --no-pager'
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
alias gax='git log --pretty=oneline -S'
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

source "/usr/local/libscala/libscala.sh"
alias gl='git --no-pager log --pretty=oneline -20'
alias j="jenkins-submit"
alias js="jenkins-scan"
alias pr="/usr/local/bin/pullrequest"
function prb () { gru && git rebase "$(pullproto)" --onto "upstream/$(pullproto)"; }
alias gt="gaika test"
alias t="gt"
function tt () { SCALAC_OPTS="-feature -optimise -Yinline-warnings" t "$@"; }
alias tall="partest --all"
function ttall () { SCALAC_OPTS="-feature -optimise -Yinline-warnings" tall "$@"; }
alias tmacro="partest-macro --macros-only"
alias tmacros="partest-macro --macros-only"
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
alias rmc="rm-classfiles"
alias jd="open *.class"
alias s="rmc && scalac *Test*.scala"
alias sli="rmc && scalac *Test*.scala -Xlog-implicits"
alias sp="rmc && scalac *Test*.scala -Xprint:parser"
alias st="rmc && scalac *Test*.scala -Xprint:typer"
alias sp="rmc && scalac *Test*.scala -Xprint:patmat"
alias sy="rmc && scalac *Test*.scala -Ymacro-debug-lite"
alias sty="rmc && scalac *Test*.scala -Ytyper-debug"
alias siy="rmc && scalac *Test*.scala -Yinfer-debug"
alias syy="rmc && scalac *Test*.scala -Ymacro-debug-verbose"
alias syyy="rmc && scalac *Test*.scala -Yquasiquote-debug"
alias sm="rmc && scalac *Macros*.scala"
alias ss="rmc && scalac *Macros*.scala && scalac Test*.scala"
alias ssli="rmc && scalac *Macros*.scala && scalac Test*.scala -Xlog-implicits"
alias ssp="rmc && scalac *Macros*.scala && scalac Test*.scala -Xprint:parser"
alias sst="rmc && scalac *Macros*.scala && scalac Test*.scala -Xprint:typer"
alias ssp="rmc && scalac *Macros*.scala && scalac Test*.scala -Xprint:patmat"
alias ssy="rmc && scalac *Macros*.scala && scalac Test*.scala -Ymacro-debug-lite"
alias ssty="rmc && scalac *Macros*.scala && scalac Test*.scala -Ytyper-debug"
alias ssiy="rmc && scalac *Macros*.scala && scalac Test*.scala -Yinfer-debug"
alias ssyy="rmc && scalac *Macros*.scala && scalac Test*.scala -Ymacro-debug-verbose"
alias ssyyy="rmc && scalac *Macros*.scala && scalac Test*.scala -Yquasiquote-debug"
alias ks="scalac *Test*.scala"
alias ksli="scalac *Test*.scala -Xlog-implicits"
alias ksp="scalac *Test*.scala -Xprint:parser"
alias kst="scalac *Test*.scala -Xprint:typer"
alias ksp="scalac *Test*.scala -Xprint:patmat"
alias ksy="scalac *Test*.scala -Ymacro-debug-lite"
alias ksty="scalac *Test*.scala -Ytyper-debug"
alias ksiy="scalac *Test*.scala -Yinfer-debug"
alias ksyy="scalac *Test*.scala -Ymacro-debug-verbose"
alias ksyyy="scalac *Test*.scala -Yquasiquote-debug"
alias ksm="scalac *Macros*.scala"
alias kss="scalac *Macros*.scala && scalac Test*.scala"
alias kssli="scalac *Macros*.scala && scalac Test*.scala -Xlog-implicits"
alias kssp="scalac *Macros*.scala && scalac Test*.scala -Xprint:parser"
alias ksst="scalac *Macros*.scala && scalac Test*.scala -Xprint:typer"
alias kssp="scalac *Macros*.scala && scalac Test*.scala -Xprint:patmat"
alias kssy="scalac *Macros*.scala && scalac Test*.scala -Ymacro-debug-lite"
alias kssty="scalac *Macros*.scala && scalac Test*.scala -Ytyper-debug"
alias kssiy="scalac *Macros*.scala && scalac Test*.scala -Yinfer-debug"
alias kssyy="scalac *Macros*.scala && scalac Test*.scala -Ymacro-debug-verbose"
alias kssyy="scalac *Macros*.scala && scalac Test*.scala -Yquasiquote-debug"
alias r="scala Test"
alias sr="rmc && scalac *Test*.scala && scala Test"
alias ssr="rmc && scalac *Macros*.scala && scalac *Test*.scala && scala Test"
alias ksr="scalac *Test*.scala && scala Test"
alias kssr="scalac *Macros*.scala && scalac *Test*.scala && scala Test"
alias sus="sync-upstream"

alias ez='subl /usr/local/dotx/.bashrc'
alias az='source $HOME/.bash_profile'
alias hm='cd "$HOME"'
alias ubi='cd "/usr/local/bin"'
alias db='cd "/Users/Shared/Dropbox/Public"'
alias dl='cd "$HOME/Downloads"'
alias prj='cd "$HOME/Projects"'
alias des='cd "$HOME/Library/Application Support/Sublime Text 3"'
alias dotx='cd "/usr/local/dotx"'
alias smo='cd "$HOME/Projects/SiteScalamacrosOrg"'
alias slo='cd "$HOME/Projects/SiteDocsScalaLangOrg"'
alias paradise2103='cd "$HOME/Projects/Paradise2103/sandbox/src/main/scala"'
alias paradise2110='cd "$HOME/Projects/Paradise2110/sandbox/src/main/scala"'
alias dex='cd "$HOME/Projects/Dex"'
alias spire='cd "$HOME/Projects/Spire"'
alias fos='cd "$HOME/Projects/teaching/fos"'
alias fose='cd "$HOME/Projects/teaching/fos/exercises"'
alias pl='cd "$HOME/Projects/Palladium"'
alias el='cd "$HOME/Projects/Eleven"'
function kep { target="$(hack-home)"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb { cd sandbox; }
function master { target="$(hack-home "master")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function 210x { target="$(hack-home "2.10.x")"; if [[ $? == 0 ]]; then cd "$target"; fi }

### Automatically managed part of .bashrc
### Don't write anything below this comment, or it might get accidentally destroyed
function manns { target="$(hack-home "manns")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function ticket6240 { target="$(hack-home "6240")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function fundep-views { target="$(hack-home "fundep-views")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function paradise-hooks { target="$(hack-home "paradise-hooks")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function patmat { target="$(hack-home "patmat")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function patmat2 { target="$(hack-home "patmat2")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function typed-annotated { target="$(hack-home "typed-annotated")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function vampires { target="$(hack-home "vampires")"; if [[ $? == 0 ]]; then cd "$target"; fi }
export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
function vampires-master { target="$(hack-home "vampires-master")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function blackbox { target="$(hack-home "blackbox")"; if [[ $? == 0 ]]; then cd "$target"; fi }