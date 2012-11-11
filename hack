#!/usr/bin/env python
import sys, os
from subprocess import check_output, Popen, PIPE

if len(sys.argv) > 3:
  print "usage: " + sys.argv[0] + " [[+|:]<branch-like> [<branch-like>]]"
  sys.exit(1)

target = sys.argv[1] if len(sys.argv) >= 2 else check_output("hack-home").strip()
add, delete = target.startswith("+"), target.startswith(":")
if add or delete: target = target[1:]
target = check_output(["hack-branch", target]).strip()
script = Popen(["hack-home", target], stdout=PIPE)
existing_home = script.communicate()[0].strip()
exists = script.returncode == 0
if exists and add: print target + " already exists at " + existing_home; sys.exit(1)
if not exists and delete: print target + " does not exist"; sys.exit(1)
prototype = sys.argv[2] if len(sys.argv) >= 3 else None

if add:
  print "adding " + target
elif delete:
  print "deleting " + target
else:
  print "selecting " + target