#!/usr/bin/env bash
sbt_root="$(sbt-root)"
if [[ $? != 0 ]]; then
  echo "not at sbt root"
  exit 1
fi

cd "$sbt_root"
sbt-the-rebel-cut "$@"