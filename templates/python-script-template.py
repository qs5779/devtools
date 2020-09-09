#!/usr/bin/env python
# -*- Mode: Python; tab-width: 2; indent-tabs-mode: nil -*-
# Revision History:
# YYYYmmdd - whoami - initial version
#

import os
import sys
import getopt

SCRIPT = os.path.basename(__file__)
VERSION = '0.1.0'
VERBOSE = 0
DEBUG = 0
ERRORS = 0

def usage():
  text="""
  usage: {script} [-d] [-h] [-v] [-V]
    where:
      -d specify debug mode
      -h show this message and exit
      -v add verbosity
      -V show version and exit
  """
  print(text.format(script=SCRIPT))
  sys.exit(1)

def main():
  global DEBUG
  global VERBOSE

  argv = sys.argv[1:]
  try:
    opts, args = getopt.getopt(
      argv, "dhvV", ["debug", "help", "verbose" "version"])

  except:
    print("Error reading args")

  for opt, arg in opts:
    if opt in ['-d', '--debug']:
      DEBUG += 1
    elif opt in ['-h', '--help']:
      usage()
    elif opt in ['-v', '--verbose']:
      VERBOSE += 1
    elif opt in ['-V', '--version']:
      print('%s Version: %s' % (SCRIPT, VERSION))
      sys.exit(0)

  if args and DEBUG > 0 and VERBOSE > 0:
    print("Argument List:", args)

if __name__ == "__main__":
  main()

# TODO: convert to python
# function trace {
#   if [ $VERBOSE -ne 0 ]
#   then
#     echo "$1"
#   fi
# }

# function tracevar {
#   if [ $VERBOSE -ne 0 ]
#   then
#     VAR=$1
#     VAL=$(eval echo \$$VAR)
#     echo "${VAR}: $VAL"
#   fi
# }
# END TODO

sys.exit(ERRORS)
