_grade() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  filenames=$({ cd "/Users/xeno_by/Projects/pp-2012-blueprint"; gfind . -maxdepth 1 ! -path '.' ! -path '*git' ! -path '*SOLUTION' ! -path '*SCRATCHPAD' -type d | sed "s/\.\/\(.*\)/\1/"; })
  COMPREPLY=( $(compgen -W "${filenames}" -- ${cur}) )
  return 0
}
complete -F _grade grade
