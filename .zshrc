######################################################################
#           jdong's zshrc file v0.2.1 , based on:
#         mako's zshrc file, v0.1
#
#
######################################################################

# next lets set some enviromental/shell pref stuff up
# setopt NOHUP
#setopt NOTIFY
#setopt NO_FLOW_CONTROL
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
# setopt AUTO_LIST    # these two should be turned off
# setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME    # tries to resume command of same name
unsetopt BG_NICE    # do NOT nice bg commands
setopt CORRECT      # command CORRECTION
setopt EXTENDED_HISTORY   # puts timestamps in the history
# setopt HASH_CMDS    # turns on hashing
#
setopt MENUCOMPLETE
setopt ALL_EXPORT

# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile


HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000
HOSTNAME="`hostname`"
    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1="%n@%m:%2c%(!.#.$) "
#LANGUAGE=
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C

unsetopt ALL_EXPORT

autoload -U compinit
compinit
bindkey "^?" backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# Tab completion should be case-insensitive.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
# on processes completion complete all user processes
# zstyle ':completion:*:processes' command 'ps -au$USER'

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#zstyle ':completion:*:processes' command 'ps ax -o pid,s,nice,stime,args | sed "/ps/d"'
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
#
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}')
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort
# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

# GIT STATUS: IMPLEMENTATION #1
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' actionformats \
#     '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
# zstyle ':vcs_info:*' formats       \
#     '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' actionformats \
    '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}[%F{2}%b%F{5}]%f ' # also try %u and %c
# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

# GIT STATUS: IMPLEMENTATION #2
# https://github.com/olivierverdier/zsh-git-prompt
# source /Users/xeno_by/Projects/Dotx/gitstatus.zsh
# RPROMPT=$'$(git_super_status)'

## http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
   _wanted files expl 'local files' _files
}

# macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# sbt
export PATH=/Users/xeno_by/Projects/SbtExtras:$PATH

# important for building scala and especially scaladoc
export ANT_OPTS="-Xms1536M -Xmx4096M -Xss2M -XX:MaxPermSize=512M -XX:+UseParallelGC"

alias ez='subl /Users/xeno_by/Projects/Dotx/.zshrc'
alias az='source /Users/xeno_by/.zshrc'

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

export PATH=/Users/xeno_by/Projects/Kepler/build/pack/bin:$PATH

export EDITOR="/usr/local/bin/subl -w"

autoload bashcompinit
bashcompinit
bash_source() {
  alias shopt=':'
  alias _expand=_bash_expand
  alias _complete=_bash_comp
  emulate -L sh
  setopt kshglob noshglob braceexpand
  source "$@"
}
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   bash_source $(brew --prefix)/etc/bash_completion
# fi

export SCALA_HOME="/Users/xeno_by/Projects/Kepler/build/pack"
export SCALA_SRC_HOME="/Users/xeno_by/Scratchpad/ScalaSrc"  # path to a scratch checkout of trunk
export SCALA_PACKS_DIR="/Users/xeno_by/Scratchpad/ScalaPacks"  # path to somewhere to cached downloaded builds
export BASH_COMPLETION_DIR="/" # dummy
export BASH_SOURCE="/Users/xeno_by/Projects/Libscala/libscala.sh"
bash_source $BASH_SOURCE

setopt no_complete_aliases
# alias git=hub
# alias gpr='git pull-request'
alias gpr='git-pull-request.py'
alias gch='git checkout'
alias gco='git commit'
alias gb='git branch'
alias gbD='git branch -D'
alias gn='git checkout -b'
alias gcio='git push origin'
function gcio+() { git push origin +$(git rev-parse --abbrev-ref HEAD) }
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
