#!/usr/bin/env bash
#
# libscala git additions
#

_git_branch () {
  local cur
	_get_comp_words_by_ref -n =: cur

	case "$cur" in
    --*)
		  __gitcomp "
  			--color --no-color --verbose --abbrev= --no-abbrev
  			--track --no-track --contains --merged --no-merged
  			--set-upstream
			"
      ;;
    *)
      __gitcomp "$(__git_refs)"
      ;;
  esac
}

_git_branch_local_only () {
  local cur
  # git function, sets cur prev words cword
	_get_comp_words_by_ref -n =: cur

	case "$cur" in
    --*)
		  __gitcomp "
  			--color --no-color --verbose --abbrev= --no-abbrev
  			--track --no-track --contains --merged --no-merged
  			--set-upstream
			"
      ;;
    *)
      __gitcomp "$(__git_heads)"
      ;;
  esac
}

_git_branch_origin_only () {
  # git function, sets cur prev words cword
	_get_comp_words_by_ref -n =: cur

	case "$cur" in
    --*)
		  __gitcomp "
  			--color --no-color --verbose --abbrev= --no-abbrev
  			--track --no-track --contains --merged --no-merged
  			--set-upstream
			"
      ;;
    *)
      __gitcomp "$(__git_refs |grep ^origin)"
      ;;
  esac
}

__git_refs_filter () {
  __gitcomp "$(__git_refs | grep "$1")"
}

__git_branch_origin () {
  __gitcomp "$(__git_refs | grep origin)"
}

__git_refs_all () {
  __gitcomp "$(__git_refs)"
}