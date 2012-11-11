#!/usr/bin/env python
import sys, os
from subprocess import Popen, PIPE

if len(sys.argv) > 3:
  print "usage: " + sys.argv[0] + " [[+|:]<branch-like> [<branch-like>]]"
  sys.exit(1)

