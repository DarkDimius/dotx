#!/usr/bin/env python
import sys, os, traceback
import subprocess
from subprocess import check_output, call, Popen, PIPE

def check_comm(*args, **kwargs):
  kwargs["stdout"] = PIPE
  kwargs["stderr"] = PIPE
  child = Popen(*args, **kwargs)
  stdout, stderr = child.communicate()
  if child.returncode != 0: raise Exception(stderr.strip())

def comm(*args, **kwargs):
  kwargs["stdout"] = PIPE
  kwargs["stderr"] = PIPE
  child = Popen(*args, **kwargs)
  child.communicate()

def checkpoint(msg):
  title = sys.argv[1]
  # if title.startswith("+") or title.startswith("-"): title = title[1:]
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
  project_home = script.communicate()[0].strip() or os.path.expandvars("$HOME/Projects/") + "Kepler_" + short_target
  exists = script.returncode == 0
  if exists and add: print target + " already exists at " + project_home; sys.exit(1)
  if not exists and not add: print target + " does not exist"; sys.exit(1)
  prototype = sys.argv[2] if len(sys.argv) >= 3 else None
  if exists and prototype: print "prototype cannot be used with a pre-existing target"; sys.exit(1)
  if not prototype: prototype = check_output("hack-branch").strip()
  prototype = check_output(["hack-home", prototype]).strip()

  projects = os.path.expandvars("$HOME/Projects/")
  project_metadata = projects + "/Metadata/" + project_home[len(projects):]
  sandbox = project_home + "/sandbox"
  sublime_projects = os.path.expandvars("$HOME/Library/Application Support/Sublime Text 2/Projects")
  sublime_project = sublime_projects + "/" + project_home[len(projects):] + ".sublime-project"
  bashrc = os.path.expandvars("$HOME/.bashrc")

  if add:
    check_comm(["git", "clone", prototype, project_home])
    check_comm(["git", "remote", "set-url", "origin", "git@github.com:scalamacros/kepler.git"], cwd = project_home)
    check_comm(["git", "remote", "add", "upstream", "git@github.com:scala/scala.git"], cwd = project_home)
    check_comm(["git", "checkout", "-b", branch], cwd = project_home)
    with open(project_home + "/.hack", "w") as f: f.write(target)
    checkpoint("Created a Git repo at " + project_home[len(projects):] + " using " + prototype[len(projects):] + " as a prototype")

    check_comm(["cp", "-r", prototype + "/build", project_home + "/build"])
    checkpoint("Cannibalized " + project_home + "/build")

    check_comm(["mkdir", sandbox])
    check_comm(["mkdir", project_metadata])
    check_comm(["ln", "-s", project_home + "/build.xml", project_metadata + "/build.xml"])
    template = open(os.path.expandvars("$HOME/.hack.sublime-project")).read()
    template = template.replace("$PROJECT_HOME", project_home)
    template = template.replace("$PROJECT_NAME", project_home[len(projects):])
    template = os.path.expandvars(template)
    with open(sublime_project, "w") as f: f.write(template)
    checkpoint("Created a Sublime project at " + sublime_project)
  elif delete:
    comm(["rm", "-rf", project_home])
    checkpoint("Deleted a Git repo at " + project_home)
    comm(["rm", "-rf", project_metadata])
    comm(["rm", sublime_project])
    checkpoint("Deleted a Sublime project at " + sublime_project)

  if not delete:
    with open(os.path.expandvars("$HOME/.hack_sublime"), "w") as f: f.write(target)
    check_comm(["subl", "--command", "my_hack"])
except:
  tpe, value, tb = sys.exc_info()
  if tpe != SystemExit:
    # print tpe
    print value
    # traceback.print_tb(tb)
    sys.exit(1)