# http://stackoverflow.com/questions/68372/what-is-your-single-most-favorite-command-line-trick-using-bash
# http://serverfault.com/questions/337123/strange-bash-history-behaviour-when-running-multiple-sessions
shopt -s cmdhist
shopt -s histappend
export HISTFILESIZE=500000
export HISTSIZE=100000
export HISTIGNORE="&:[ ]*:exit"
export HISTCONTROL="erasedups:ignoreboth"
stty stop ""

source $(brew --prefix)/etc/bash_completion
source $HOME/.git-completion.bash
function parse_git_branch {
  ref=$(git rev-parse --abbrev-ref HEAD 2> /dev/null) || return
  echo " ("${ref#refs/heads/}")"
}
PS1="\$(date +%H:%M) \w\$(parse_git_branch)\$ "

# moved to launchd.conf
# export SCALA_HOME="/Users/xeno_by/Projects/Kepler/build/pack"
# export SCALA_SRC_HOME="/Users/xeno_by/Scratchpad/ScalaSrc"  # path to a scratch checkout of trunk
# export SCALA_PACKS_DIR="/Users/xeno_by/Scratchpad/ScalaPacks"  # path to somewhere to cached downloaded builds
source "/Users/xeno_by/Projects/Libscala/libscala.sh"

# alias git=hub
# alias gpr='git pull-request'
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
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'
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
alias grm='git reset --mixed'
alias grm0='git reset --mixed HEAD'
alias grm1='git reset --mixed HEAD~1'
alias grm2='git reset --mixed HEAD~2'
alias grm3='git reset --mixed HEAD~3'
alias grm4='git reset --mixed HEAD~4'
alias grm5='git reset --mixed HEAD~5'
alias gm='git merge'
alias gma='git merge --abort'

alias j="jenkins-submit"
alias pr='git-pull-request'

# moved to launchd.conf
# export EDITOR="/usr/local/bin/subl -w"
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH # macports
# export PATH=/Users/xeno_by/Projects/Kepler/build/pack/bin:$PATH # until I resurrect myke
# export ANT_OPTS="-Xms1536M -Xmx2560M -Xss2M -XX:MaxPermSize=384M -XX:+UseParallelGC"

alias ez='subl /Users/xeno_by/Projects/Dotx/.bashrc'
alias az='source /Users/xeno_by/.bash_profile'
alias hm='cd "/Users/xeno_by"'
alias ubi='cd "/usr/local/bin"'
alias db='cd "/media/XENO/Dropbox"'
alias dl='cd "/Users/xeno_by/Downloads"'
alias prj='cd "/Users/xeno_by/Projects"'
alias kep='cd "/Users/xeno_by/Projects/Kepler"'
alias ide='cd "/Users/xeno_by/Projects/ScalaIDE"'
alias ens='cd "/Users/xeno_by/Projects/Ensime"'
alias sens='cd "/Users/xeno_by/Library/Application Support/Sublime Text 2/Packages/Ensime"'
alias des='cd "/Users/xeno_by/Library/Application Support/Sublime Text 2"'
alias pap='cd "/Users/xeno_by/Projects/Pages"'
alias dotx='cd "/Users/xeno_by/Projects/Dotx"'
alias sb='cd "/Users/xeno_by/Projects/Kepler/sandbox"'
