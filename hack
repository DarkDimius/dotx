#!/usr/bin/env python
import sys, os, traceback, time, subprocess, uuid
from subprocess import check_output, call, Popen, PIPE

interactive = not "--batch" in sys.argv
force = "--force" in sys.argv
sys.argv = filter(lambda arg: not arg.startswith("--"), sys.argv)

def check_comm(*args, **kwargs):
  kwargs["stdout"] = PIPE
  kwargs["stderr"] = PIPE
  child = Popen(*args, **kwargs)
  stdout, stderr = child.communicate()
  if child.returncode != 0: raise Exception(stderr.strip())
  return stdout.splitlines()

def comm(*args, **kwargs):
  kwargs["stdout"] = PIPE
  kwargs["stderr"] = PIPE
  child = Popen(*args, **kwargs)
  child.communicate()

def checkpoint(msg):
  title = sys.argv[1]
  # if title.startswith("+") or title.startswith("-"): title = title[1:]
  title = "Hack " + title
  if interactive: call(["growlnotify", "-n", title, "-m", msg])
  print msg

def update_bashrc(fn):
  bashrc = open(os.path.expandvars("$HOME/.bashrc")).read().splitlines()
  index = bashrc.index("### Automatically managed part of .bashrc")
  bashrc = bashrc[:index] + fn(bashrc[index:])
  with open(os.path.expandvars("$HOME/.bashrc"), "w") as f: f.write("\n".join(bashrc))

try:
  if len(sys.argv) > 3: print >> sys.stderr, "usage: " + sys.argv[0] + " [[+|-]<target> [<prototype>]] [--interactive|--batch]"; sys.exit(1)
  target = sys.argv[1] if len(sys.argv) >= 2 else check_output("hack-branch").strip()
  original_target = target
  add, delete = target.startswith("+"), target.startswith("-")
  if add or delete: target = target[1:]
  target = check_output(["hack-branch", target]).strip()
  branch = target[target.find(":") + 1:]
  short_target = target[target.rfind("/") + 1:]
  bash_alias = "ticket" + short_target if short_target[0].isdigit() else short_target
  script = Popen(["hack-home", target], stdout=PIPE)
  project_home = script.communicate()[0].strip() or os.path.expandvars("$HOME/Projects/") + short_target
  exists = script.returncode == 0
  if exists and add: print >> sys.stderr, target + " already exists at " + project_home; sys.exit(1)
  if not exists and not add: print >> sys.stderr, target + " does not exist"; sys.exit(1)
  prototype = sys.argv[2] if len(sys.argv) >= 3 else None
  if exists and prototype: print >> sys.stderr, "prototype cannot be used with a pre-existing target"; sys.exit(1)
  if not prototype: prototype = check_output("hack-prototype").strip()
  prototype = check_output(["hack-home", prototype]).strip()

  projects = os.path.expandvars("$HOME/Projects/")
  project_metadata = projects + "/../Metadata/" + project_home[len(projects):]
  sandbox = project_home + "/sandbox"
  sublime_projects = os.path.expandvars("$HOME/Library/Application Support/Sublime Text 3/Projects")
  sublime_project = sublime_projects + "/" + project_home[len(projects):].lower() + ".sublime-project"
  sublime_workspace = sublime_projects + "/" + project_home[len(projects):].lower() + ".sublime-workspace"
  bashrc = os.path.expandvars("$HOME/.bashrc")

  if add:
    check_comm(["git", "clone", prototype, project_home])
    check_comm(["git", "remote", "set-url", "origin", "git@github.com:xeno-by/scala.git"], cwd = project_home)
    check_comm(["git", "remote", "add", "upstream", "git@github.com:scala/scala.git"], cwd = project_home)
    check_comm(["git", "remote", "update"], cwd = project_home)
    try: check_comm(["git", "checkout", branch], cwd = project_home)
    except: check_comm(["git", "checkout", "-b", branch], cwd = project_home)
    with open(project_home + "/.hack", "w") as f: f.write(target)
    with open(project_home + "/.gitignore", "w") as f: f.write("*.jar")
    checkpoint("Created a Git repo at " + project_home[len(projects):] + " using " + prototype[len(projects):] + " as a prototype")

    check_comm(["cp", "-r", prototype + "/build", project_home + "/build"])
    partest_properties = project_name + "/build/pack/partest.properties"
    if os.file.exists(partest_properties): check_comm(["rm", partest_properties])
    checkpoint("Cannibalized " + project_home + "/build")

    check_comm(["mkdir", sandbox])
    check_comm(["mkdir", project_metadata])
    check_comm(["ln", "-s", project_home + "/build.xml", project_metadata + "/build.xml"])
    check_comm(["ln", "-s", project_home + "/.partest", project_metadata + "/.partest"])
    template = open(os.path.expandvars("$HOME/.hack.sublime-project")).read()
    template = template.replace("$PROJECT_HOME", project_home)
    template = template.replace("$PROJECT_NAME", project_home[len(projects):])
    template = os.path.expandvars(template)
    with open(sublime_project, "w") as f: f.write(template)
    checkpoint("Created a Sublime project at " + sublime_project)

    check_comm(["alfred-sync-projects"])
    checkpoint("Created an Alfred shortcut named " + short_target)

    def create_aliases(bashrc):
      bashrc.append("""function {0} { target="$(hack-home "{1}")"; if [[ $? == 0 ]]; then cd "$target/sandbox"; fi }""".replace("{0}", bash_alias).replace("{1}", short_target))
      return bashrc
    update_bashrc(create_aliases)
    checkpoint("Created Bash alias " + bash_alias)
  elif delete:
    introspect = check_comm(["hub-introspect"], cwd = project_home)
    status = introspect[3]
    if not force and not status.startswith("no changes"): raise Exception(status)

    comm(["rm", "-rf", project_home])
    checkpoint("Deleted the Git repo at " + project_home)
    comm(["rm", "-rf", project_metadata])
    comm(["rm", sublime_project])
    comm(["rm", sublime_workspace])
    checkpoint("Deleted the Sublime project at " + sublime_project)
    comm(["alfred-sync-projects"])
    checkpoint("Deleted the Alfred shortcut named " + short_target)
    def delete_aliases(bashrc):
      aliasdef_prefix = """function {0} {""".replace("{0}", bash_alias)
      return [line for line in bashrc if not line.startswith(aliasdef_prefix)]
    update_bashrc(delete_aliases)
    checkpoint("Deleted Bash alias " + bash_alias)

  if interactive:
    if not delete:
      check_comm(["subl-open-project", sublime_project])
except:
  tpe, value, tb = sys.exc_info()
  if tpe != SystemExit:
    print tpe
    print >> sys.stderr, value
    traceback.print_tb(tb)
    sys.exit(1)