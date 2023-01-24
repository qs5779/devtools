#!/bin/sh
# shellcheck shell=dash
# vim:sta:et:sw=2:ts=2:syntax=sh
#

SCRIPT=$(basename "$0")
VERSION='Revision: 0.1.0'
VERBOSE=0
DEBUG=0
ENVIRONMENTS=''

add_environment() {
  local I="$1"
  local D="${2:- }" #delimeter could be any char,default space

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

usage() {
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
      DEBUG=$((DEBUG+=1))
      VERBOSE=$((VERBOSE+=1))
    ;;
    e )
      add_environment "${OPTARG}"
      ;;
    h )
      usage
    ;;
    v ) VERBOSE=$((VERBOSE+=1)) ;;
    V )
      echo "$SCRIPT VERSION: $(echo "$VERSION" | awk '{ print $2 }')"
      exit 0
    ;;
    * )
      echo "Unexpected option \"$opt\""
      usage
    ;;
  esac
done
shift $((OPTIND - 1))
