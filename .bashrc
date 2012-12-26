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
alias sbtsnap="sbt -sbt-snapshot"

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
alias docs='cd "$HOME/Projects/DocsScalaLang"'
alias smock='cd "$HOME/Projects/ScalaMock"'
function kep { target="$(hack-home)"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb { target="$(hack-home)/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function master { target="$(hack-home "master")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbmaster { target="$(hack-home "master")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function paradise { target="$(hack-home "paradise/macros")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbparadise { target="$(hack-home "paradise/macros")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }

### Automatically managed part of .bashrc
### Don't write anything below this comment, or it might get accidentally destroyed
function kepmaster { target="$(hack-home "master")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbmaster { target="$(hack-home "master")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep6751 { target="$(hack-home "6751")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb6751 { target="$(hack-home "6751")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepunapply-macros { target="$(hack-home "unapply-macros")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbunapply-macros { target="$(hack-home "unapply-macros")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepident-deprecation-warnings { target="$(hack-home "ident-deprecation-warnings")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbident-deprecation-warnings { target="$(hack-home "ident-deprecation-warnings")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepannotation-error { target="$(hack-home "annotation-error")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbannotation-error { target="$(hack-home "annotation-error")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
function kepident-attachments { target="$(hack-home "ident-attachments")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbident-attachments { target="$(hack-home "ident-attachments")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function keppatmat-positionless { target="$(hack-home "patmat-positionless")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbpatmat-positionless { target="$(hack-home "patmat-positionless")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepmacros-unapply { target="$(hack-home "macros-unapply")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbmacros-unapply { target="$(hack-home "macros-unapply")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function keptree-nonempty { target="$(hack-home "tree-nonempty")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbtree-nonempty { target="$(hack-home "tree-nonempty")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepshowrawpos { target="$(hack-home "showrawpos")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbshowrawpos { target="$(hack-home "showrawpos")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepreflection { target="$(hack-home "reflection")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbreflection { target="$(hack-home "reflection")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepfresh-name { target="$(hack-home "fresh-name")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbfresh-name { target="$(hack-home "fresh-name")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepenclosures { target="$(hack-home "enclosures")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbenclosures { target="$(hack-home "enclosures")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepintroduce-top-level { target="$(hack-home "introduce-top-level")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbintroduce-top-level { target="$(hack-home "introduce-top-level")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kepauto-duplicate-expansions { target="$(hack-home "auto-duplicate-expansions")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sbauto-duplicate-expansions { target="$(hack-home "auto-duplicate-expansions")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }