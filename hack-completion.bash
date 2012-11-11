_hack()
{
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  # unfortunately my bash fu is not enough to deduplicate this code

  if [[ ${#COMP_WORDS[@]} == 2 ]]; then
    if [[ ${cur} == -* ]] ; then
      opts="$(hack-homes --branches | while read line; do echo "-$line"; done)"
      COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
      return 0
    fi

    opts="$(hack-homes --branches | while read line; do echo "$line"; done)"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  elif [[ ${#COMP_WORDS[@]} == 3 ]]; then
    if [[ ${prev} == +* ]] ; then
      opts="$(hack-homes --branches | while read line; do echo "$line"; done)"
      COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
      return 0
    fi
  fi
}
complete -F _hack hack