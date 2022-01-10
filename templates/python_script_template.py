#!/usr/bin/env python3
# -*- Mode: Python; tab-width: 2; indent-tabs-mode: nil -*-
"""Python_script_template module."""
import sys
from pathlib import Path
import argparse
import textwrap

VERSION = '1.0.0'

def main():
  """This is the main function."""
  parser = argparse.ArgumentParser(
    # prog = 'letitdefault to basename "$0"',
    formatter_class=argparse.RawDescriptionHelpFormatter,
    epilog=textwrap.dedent('''\
      aditional information:
        Add any additional help text you like.
      '''))
  # the next two lines are positional arguments
  parser.add_argument("infile", help='specify path to input file')
  parser.add_argument("outfile", help='specify path to output file')
  parser.add_argument("-d", "--debug",
    action="count", dest="debug", default=0, help='increment debug level')
  parser.add_argument("-t", "--test",
    action="store_true", dest="test", default=False, help='sets test flag')
  parser.add_argument("-v", "--verbose",
    action="count", dest="verbose", default=0, help='increment verbosity level')
  parser.add_argument("-V", "--version",
    action="store_true", dest="version", default=False, help='show version and exit')

  args = parser.parse_args()

  options = vars(args)
  if options['debug']>1:
    print (options)
    print (args)

  if options['version']:
    # print('%s Version: %s' % (Path(sys.argv[0]).name, VERSION))
    # print("{} Version: {}".format(Path(sys.argv[0]).name, VERSION))
    print(f"{Path(sys.argv[0]).name} Version: {VERSION}")
    sys.exit(0)

  exit_code = 0
  sys.exit(exit_code)

if __name__ == "__main__":
  main()
