#!/usr/bin/env bash
sbt_root="$(sbt-root)"
if [[ -z "$sbt_root" ]]; then
  echo "not in an SBT project"
  exit 1
fi

cd "$sbt_root"

if [[ "$sbt_root" == "/Users/xeno_by/Projects/ParadiseHooked" ]]; then
  # sbt-the-rebel-cut "$@"
  sbt-the-rebel-cut -Dparadise.scala.home="$(scala-root)/build/pack" "$@"
else
  sbt-the-rebel-cut "$@"
fi
