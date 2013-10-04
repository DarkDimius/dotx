#!/usr/bin/env bash
talk_process="$(ps axu | grep 'muCommander' | grep -v 'grep muCommander')"
if [[ $? == 1 ]]; then
  open -a muCommander
  sleep 2.0
fi

open -a muCommander ${1:-.}
