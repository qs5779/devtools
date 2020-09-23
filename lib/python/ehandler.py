# vim:sta:et:sw=2:ts=2:ft=py
# -*- Mode: Python; tab-width: 2; indent-tabs-mode: nil -*-
# Revision History:
# 20200909 - que - initial version
#

import os
import sys

def eprint(*args, **kwargs):
  print(*args, file=sys.stderr, **kwargs)

def abend_dir_notfound(dpn):
  if not os.path.exists(dpn):
    eprint('Aborting, directory not found: "%s" !!!' % (dpn))
    sys.exit(1)
  if not os.path.isdir(dpn):
    eprint('Aborting, "%s" is not a directory!!!' % (dpn))
    sys.exit(1)

def abend_file_notfound(fpn):
  if not os.path.exists(fpn):
    eprint('Aborting, file not found: "%s" !!!' % (fpn))
    sys.exit(1)
  if not os.path.isfile(fpn):
    eprint('Aborting, "%s" is not a file!!!' % (fpn))
    sys.exit(1)

