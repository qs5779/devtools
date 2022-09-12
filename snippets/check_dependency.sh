#!/bin/bash
# -*- Mode: Bash; tab-width: 2; indent-tabs-mode: nil -*- vim:sta:et:sw=2:ts=2:syntax=sh
#

SCRIPT=$(basename "$0")

function check_dependency {
  typeset D="$1"

  if ( which "$D" 2>&1 | grep -e "^which: no " -e "^no ")
  then
    echo "${SCRIPT}: Aborting - unable to resolve dependency: $D" >&2
    exit 1
  fi
}
