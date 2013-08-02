_partest() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [[ ${cur} == -* ]]; then
    COMPREPLY=( $(compgen -W "--debug --verbose --show-log --show-diff --update-check --all" -- ${cur}) )
    return 0
  else
    # TODO: deduplicate
    if [[ ${cur} == */* ]]; then
      filenames=$({ cd "$(scala-root)"; gfind "test/files" -path "test/files/${cur}*" ! -path "test/files/${cur}*/*" ! -path "*.flags" ! -path "*.check" ! -path "*.log" | sed "s/test\/files\/\(.*\)/\1/"; })
    else
      filenames=$({ cd "$(scala-root)"; gfind "test/files" -path "test/files/${cur}*" ! -path "test/files/${cur}*/*" ! -path "*.flags" ! -path "*.check" ! -path "*.log" \( -type d -printf "%p/\n" , -type f -print \) | sed "s/test\/files\/\(.*\)/\1/"; })
    fi
    COMPREPLY=( $(compgen -W "${filenames}" -- ${cur}) )
    [[ $COMPREPLY = */ ]] && compopt -o nospace
    return 0
  fi
}
complete -F _partest partest
complete -F _partest t