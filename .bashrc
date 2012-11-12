# http://stackoverflow.com/questions/68372/what-is-your-single-most-favorite-command-line-trick-using-bash
# http://serverfault.com/questions/337123/strange-bash-history-behaviour-when-running-multiple-sessions
shopt -s cmdhist
shopt -s histappend
export HISTFILESIZE=500000
export HISTSIZE=100000
export HISTIGNORE="&:[ ]*:exit"
export HISTCONTROL="erasedups:ignoreboth"
if [[ "$TERM" != "dumb" ]]; then stty stop ""; fi

# environment variables have been moved to launchd.conf

source $(brew --prefix)/etc/bash_completion
source $HOME/.git-completion.bash
source $HOME/.hack-completion.bash
export PYTHONSTARTUP=/Users/xeno_by/.pystartup

function parse_git_branch {
  ref=$(git rev-parse --abbrev-ref HEAD 2> /dev/null) || return
  echo " ("${ref#refs/heads/}")"
}
PS1="\$(date +%H:%M) \w\$(parse_git_branch)\$ "

alias gch='git checkout'
alias gco='git commit'
alias gb='git branch'
alias gbD='git branch -D'
alias gn='git checkout -b'
function gci { git push origin $(git rev-parse --abbrev-ref HEAD); }
function gci+ { git push origin +$(git rev-parse --abbrev-ref HEAD); }
alias gpo='git pull origin'
alias gpu='git pull upstream'
alias gs='git status'
alias grb='git rebase'
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

source "$HOME/Projects/Libscala/libscala.sh"
alias j="jenkins-submit"
alias js="jenkins-scan"
alias pr="pullrequest"
alias t="partest"
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
alias tv="partest-suite --view-with-numbers"
alias te="partest-suite --edit"
alias tc="partest-create"
alias h="hack"
alias hh="hack-homes --all"
complete -F _hack h
complete -F _hack_homes hh

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

### Automatically managed part of .bashrc
### Don't write anything below this comment, or it might get accidentally destroyed
function kep_6023 { target="$(hack-home "6023")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb_6023 { target="$(hack-home "6023")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep_showraw-nodeprinters { target="$(hack-home "showraw-nodeprinters")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb_showraw-nodeprinters { target="$(hack-home "showraw-nodeprinters")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }
function kep_typetags-local-classes { target="$(hack-home "typetags-local-classes")"; if [[ $? == 0 ]]; then cd "$target"; fi }
function sb_typetags-local-classes { target="$(hack-home "typetags-local-classes")/sandbox"; if [[ $? == 0 ]]; then cd "$target"; fi }