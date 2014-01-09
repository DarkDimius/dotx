#!/usr/bin/env bash
sbt_root="$(sbt-root)"
if [[ -z "$sbt_root" ]]; then
  echo "not in an SBT project"
  exit 1
fi

cd "$sbt_root"
sbt-the-rebel-cut "$@"
