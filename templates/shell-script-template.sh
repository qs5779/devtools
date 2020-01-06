#!/bin/bash
# -*- Mode: Bash; tab-width: 2; indent-tabs-mode: nil -*-
# Revision History:
# YYYYmmdd - whoami - initial version
#

SCRIPT=$(basename "$0")
VERSION='0.1.0'
VERBOSE=0
DEBUG=0
ERRORS=0

function usage {
  cat << EOM
usage: $SCRIPT [-d] [-h] [-v] [-V]
  where:
    -d specify debug mode
    -h show this message and exit
    -v add verbosity
    -V show version and exit
EOM
  exit 1
}

while getopts ":dhvV" opt
do
  case "$opt" in
    d )
      ((DEBUG+=1))
      ((VERBOSE+=1))
    ;;
    h )
      usage
    ;;
    v ) ((VERBOSE+=1)) ;;
    V )
      echo "$SCRIPT VERSION: $VERSION"
      exit 0
    ;;
    * )
      echo "Unexpected option \"$opt\""
      usage
    ;;
  esac
done
shift $((OPTIND - 1))

function trace {
  if [ $VERBOSE -ne 0 ]
  then
    echo "$1"
  fi
}

function tracevar {
  if [ $VERBOSE -ne 0 ]
  then
    VAR=$1
    VAL=$(eval echo \$$VAR)
    echo "${VAR}: $VAL"
  fi
}

# ERRORS=$((ERRORS+=1)) # darn ubuntu default dash shell
exit $ERRORS

# vim:sta:et:sw=2:ts=2:syntax=sh
