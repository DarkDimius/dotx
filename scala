#!/usr/bin/env python
import os, sys, subprocess

root = subprocess.Popen(["scala-root"], stdout=subprocess.PIPE).communicate()[0][:-1]
bin = root + "/build/pack/bin/scala"

if not os.path.exists(bin):
  print bin + " does not exist"
  sys.exit(1)

args = sys.argv[1:] + ["-Dscala.repl.autoruncode=/Users/xeno_by/.scala_autorun"]
subprocess.call([bin] + args)