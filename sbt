#!/usr/bin/env bash
sbt_root="$(sbt-root)"
if [[ -z "$sbt_root" ]]; then
  echo "not at sbt root"
  exit 1
fi

cd "$sbt_root"
sbt-the-rebel-cut -Dmy.scala.home="$(scala-root)" "$@"
# sbt-the-rebel-cut "$@"
