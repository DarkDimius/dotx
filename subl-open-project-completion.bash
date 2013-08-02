_subl_open_project() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  # TODO: deduplicate
  filenames=$({ cd "$HOME/Library/Application Support/Sublime Text 3/Projects"; gfind "." -path "*.sublime-project" | sed "s/\.\/\(.*\)\.sublime-project/\1/"; })
  COMPREPLY=( $(compgen -W "${filenames}" -- ${cur}) )
  [[ $COMPREPLY = */ ]] && compopt -o nospace
  return 0
}
complete -F _subl_open_project subl-open-project
complete -F _subl_open_project sop