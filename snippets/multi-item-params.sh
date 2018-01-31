#!/bin/bash
# -*- Mode: Bash; tab-width: 2; indent-tabs-mode: nil -*- vim:sta:et:sw=2:ts=2:syntax=sh
#

SCRIPT=$(basename "$0")
VERSION='$Revision: 1 $'
VERBOSE=0
DEBUG=0
ERRORS=0
ENVIRONMENTS=''

function add_environment {
  typeset I="$1"
  typeset D="${2:- }" #delimeter could be any char,default space

  if [ -n "$I" ]
  then
    # allow user to use space, comma or semicolon as delimeter and change to ours
    #I=$(echo $I | sed -e "s/ */${DELIMITER}/g" -e "s/[,;]\+/${DELIMITER}/g")
    I=$(perl -e "print join('${D}', split(/[,; ]+/, join(',', @ARGV)))" "$I")
    if [ -n "$ENVIRONMENTS" ]
    then
      ENVIRONMENTS="$ENVIRONMENTS $I"
    else
      ENVIRONMENTS="$I"
    fi
  fi
}

function usage {
  cat << EOM
usage: $SCRIPT [-d] [-e editor] [-h] [-v] [-V]
  where:
    -d             - specify debug mode
    -e environment - default dev
    -h             - show this message and exit
    -v             - add verbosity
    -V             - show version and exit
EOM
  exit 1
}

while getopts ":de:hvV" opt
do
  case "$opt" in
    d )
      ((DEBUG+=1))
      ((VERBOSE+=1))
    ;;
    e )
      add_environment "${OPTARG}"
      ;;
    h )
      usage
    ;;
    v ) ((VERBOSE+=1)) ;;
    V )
      echo "$SCRIPT VERSION: $(echo $VERSION | awk '{ print $2 }')"
      exit 0
    ;;
    * )
      echo "Unexpected option \"$opt\""
      usage
    ;;
  esac
done
shift $((OPTIND - 1))
