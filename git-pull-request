#!/usr/bin/env python
import os, sys, re, json
from subprocess import Popen, PIPE

if len(sys.argv) > 2:
  print "usage: " + sys.argv[0] + " [<target branch>]"
  print "if the target branch is not specified"
  print "the script will try to load it from ~/.git-pull-request"
  sys.exit(1)
target_branch = sys.argv[1] if len(sys.argv) == 2 else None

origin = Popen(["git", "config", "--get", "remote.origin.url"], stdout=PIPE).communicate()[0]
if not origin:
  print "not a git repo"
  sys.exit(2)

def match1(): return re.match("^git://github.com/(?P<user>.*?)/(?P<repo>.*).git$", origin)
def match2(): return re.match("^git@github.com:(?P<user>.*?)/(?P<repo>.*).git$", origin)
m = match1() or match2()
if not m:
  print "origin (" + origin + ") doesn't point to a github repo"
  sys.exit(3)

changed = Popen(['git','diff','--name-status'], stdout=PIPE, stderr=PIPE).communicate()[0].splitlines()
staged = Popen(['git','diff', '--staged','--name-status'], stdout=PIPE).communicate()[0].splitlines()
untracked = Popen(['git','ls-files','--others','--exclude-standard'],stdout=PIPE).communicate()[0].splitlines()
if changed or staged or untracked:
  if changed: print "repository is dirty (has modified files)"
  elif staged: print "repository is dirty (has staged files)"
  elif untracked: print "repository is dirty (has untracked files)"
  sys.exit(4)

branch = Popen(["git", "rev-parse", "--abbrev-ref", "HEAD"], stdout=PIPE).communicate()[0][:-1]
ahead = None
behind = None
if not branch: # not on any branch
  branch = Popen(['git','rev-parse','--short','HEAD'], stdout=PIPE).communicate()[0][:-1]
else:
  remote_name = Popen(['git','config','branch.%s.remote' % branch], stdout=PIPE).communicate()[0].strip()
  if remote_name:
    merge_name = Popen(['git','config','branch.%s.merge' % branch], stdout=PIPE).communicate()[0].strip()
    if remote_name == '.': # local
      remote_ref = merge_name
    else:
      remote_ref = 'refs/remotes/%s/%s' % (remote_name, merge_name[11:])
    revgit = Popen(['git', 'rev-list', '--left-right', '%s...HEAD' % remote_ref],stdout=PIPE, stderr=PIPE)
    revlist = revgit.communicate()[0]
    if revgit.poll(): # fallback to local
      revlist = Popen(['git', 'rev-list', '--left-right', '%s...HEAD' % merge_name],stdout=PIPE, stderr=PIPE).communicate()[0]
    behead = revlist.splitlines()
    ahead = len([x for x in behead if x[0]=='>'])
    behind = len(behead) - ahead
if ahead or behind:
  print "repository is dirty (head is different from remote)"
  sys.exit(5)

try:
  with open(os.path.expandvars("$HOME/.git-pull-request"), "r") as f:
    config = json.load(f)
except Exception as e:
  config = []
target_branch = target_branch or config.get(m.expand("\g<user>:\g<repo>"))

url = m.expand("https://github.com/\g<user>/\g<repo>/pull/new/")
if target_branch:
  url += target_branch + "..."
url += branch

import webbrowser
webbrowser.open(url)
