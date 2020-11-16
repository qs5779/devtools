#!/usr/bin/env python
# -*- Mode: Python; tab-width: 2; indent-tabs-mode: nil -*-

import sys
import os.path
from optparse import OptionParser

def main():
  usage = "usage: %prog [options]"
  parser = OptionParser(usage)
  parser.add_option("-d", "--debug", action="count", dest="debug", default=0, help='increment debug level')
  parser.add_option("-t", "--test", action="store_true", dest="test", default=False, help='sets test flag')
  parser.add_option("-v", "--verbose", action="count", dest="verbose", default=0, help='increment verbosity level')
  parser.add_option("-V", "--version", action="store_true", dest="version", default=False, help='show version and exit')

  (opts, args) = parser.parse_args()

  options = vars(opts)
  if options['debug']>1:
    print (options)
    print (args)

  if options['version']:
    basenm = os.path.basename(sys.argv[0])
    print('%s Version: 1.0.0' % basenm)
    exit(0)

  # uncomment next 3 lines to force options while debugging
  # gettrace = getattr(sys, 'gettrace', None)
  # if gettrace is not None and gettrace():
  #     print('Hmm, Big Debugger is watching me')
  
  exit_code = 0
  exit(exit_code)

if __name__ == "__main__":
    main()
