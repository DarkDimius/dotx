#!/usr/bin/env bash
sbt_root="$(sbt-root)"
if [[ -z "$sbt_root" ]]; then
  echo "not in an SBT project"
  exit 1
else
  cd "$sbt_root"
fi

if [[ "$sbt_root" == /Users/xeno_by/Projects/sbt* ]]; then
  quick="$(scala-root)/build/quick"
  pack="$(scala-root)/build/pack"
  echo "using non-standard sbt options: -scala-version 2.11.0-M8 -scala-home \"$pack\""
  if [[ "$pack/lib/scala-library.jar" -ot "$quick/library.complete" ]]; then echo -e "[\e[31merror\e[0m] $pack/lib/scala-library.jar is stale"; exit 1; fi
  if [[ "$pack/lib/scala-reflect.jar" -ot "$quick/reflect.complete" ]]; then echo -e "[\e[31merror\e[0m] $pack/lib/scala-reflect.jar is stale"; exit 1; fi
  if [[ "$pack/lib/scala-compiler.jar" -ot "$quick/compiler.complete" ]]; then echo -e "[\e[31merror\e[0m] $pack/lib/scala-compiler.jar is stale"; exit 1; fi
  sbt-the-rebel-cut -scala-version 2.11.0-M8 -scala-home "$pack" "$@"
else
  sbt-the-rebel-cut "$@"
fi
