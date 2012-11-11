_hak() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  # unfortunately my bash fu is not enough to deduplicate this code

  if [[ ${#COMP_WORDS[@]} == 2 ]]; then
    if [[ ${cur} == -* ]] ; then
      opts="$(hack-homes --short-branches | while read line; do echo "-$line"; done)"
      COMPREPLY=( $(compgen -W "${opts} snippet macrosnippet" -- ${cur}) )
      return 0
    fi

    opts="$(hack-homes --short-branches | while read line; do echo "$line"; done)"
    COMPREPLY=( $(compgen -W "${opts} snippet macrosnippet" -- ${cur}) )
    return 0
  elif [[ ${#COMP_WORDS[@]} == 3 ]]; then
    if [[ ${prev} == +* ]] ; then
      opts="$(hack-homes --short-branches | while read line; do echo "$line"; done)"
      COMPREPLY=( $(compgen -W "${opts} snippet macrosnippet" -- ${cur}) )
      return 0
    fi
  fi
}
complete -F _hak hak

_hack_home() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  # unfortunately my bash fu is not enough to deduplicate this code

  if [[ ${#COMP_WORDS[@]} == 2 ]]; then
    opts="$(hack-homes --short-branches | while read line; do echo "$line"; done)"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _hack_home hack-home

_hack_homes() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="--dirs --short-branches --full-branches"

  if [[ ${#COMP_WORDS[@]} == 2 ]]; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _hack_homes hack-homes