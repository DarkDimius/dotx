#!/usr/bin/env python
import sys, os, traceback
import subprocess
from subprocess import check_output, call, Popen, PIPE

def check_call(*args, **kwargs):
  kwargs["stdout"] = PIPE
  kwargs["stderr"] = PIPE
  child = Popen(*args, **kwargs)
  stdout, stderr = child.communicate()
  if child.returncode != 0: raise Exception(stderr.strip())

def checkpoint(msg):
  title = sys.argv[1]
  if title.startswith("+") or title.startswith("-"): title = title[1:]
  title = "Hack " + title
  call(["growlnotify", "-n", title, "-m", msg])
  print msg

try:
  if len(sys.argv) > 3: print "usage: " + sys.argv[0] + " [[+|-]<target> [<prototype>]]"; sys.exit(1)
  target = sys.argv[1] if len(sys.argv) >= 2 else check_output("hack-branch").strip()
  add, delete = target.startswith("+"), target.startswith("-")
  if add or delete: target = target[1:]
  target = check_output(["hack-branch", target]).strip()
  branch = target[target.find(":") + 1:]
  short_target = target[target.rfind("/") + 1:]
  script = Popen(["hack-home", target], stdout=PIPE)
  existing_home = script.communicate()[0].strip()
  exists = script.returncode == 0
  if exists and add: print target + " already exists at " + existing_home; sys.exit(1)
  if not exists and not add: print target + " does not exist"; sys.exit(1)
  prototype = sys.argv[2] if len(sys.argv) >= 3 else None
  if exists and prototype: print "prototype cannot be used with a pre-existing target"; sys.exit(1)
  if not prototype: prototype = check_output("hack-branch").strip()
  prototype = check_output(["hack-home", prototype]).strip()

  if add:
    projects = os.path.expandvars("$HOME/Projects/")
    existing_home = projects + "Kepler_" + short_target
    check_call(["git", "clone", prototype, existing_home])
    check_call(["git", "remote", "set-url", "origin", "git@github.com:scalamacros/kepler.git"], cwd = existing_home)
    check_call(["git", "remote", "add", "upstream", "git@github.com:scala/scala.git"], cwd = existing_home)
    check_call(["git", "checkout", "-b", branch], cwd = existing_home)
    with open(existing_home + "/.hack", "w") as f: f.write(target)
    checkpoint("Created a Git repo at " + existing_home[len(projects):] + " using " + prototype[len(projects):] + " as a prototype")
  elif delete:
    check_call(["rm", "-rf", existing_home])
    checkpoint("Deleted " + existing_home)

  if not delete:
    with open(os.path.expandvars("$HOME/.hack_sublime"), "w") as f: f.write(target)
    check_call(["subl", "--command", "my_hack"])
except:
  tpe, value, tb = sys.exc_info()
  if tpe != SystemExit:
    # print tpe
    print value
    # traceback.print_tb(tb)
    sys.exit(1)