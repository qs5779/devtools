#!/bin/sh
# shellcheck shell=dash
# Revision History:
# YYYYmmdd - whoami - initial version
#

set -e
for arg in "$@"; do
    [ "$arg" = "-d" ] && set -x && break
done

SCRIPT=$(basename "$0")
VERSION='0.1.0'
VERBOSE=0
DEBUG=0
ERRORS=0

# shellcheck disable=SC2119,SC2120
usage() {
  [ -n "$1" ] && printf "%s\n" "$1" >&2
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
      DEBUG=$((DEBUG+1))
      VERBOSE=$((VERBOSE+1))
    ;;
    h )
      usage
    ;;
    v ) VERBOSE=$((VERBOSE+1)) ;;
    V )
      echo "$SCRIPT VERSION: $VERSION"
      exit 0
    ;;
    * )
      usage "Unexpected option \"$opt\""
    ;;
  esac
done
shift $((OPTIND - 1))

debug() {
  [ "$DEBUG" -ne 0 ] && return 0
  return 1
}

verbose() {
  [ "$VERBOSE" -ne 0 ] && return 0
  return 1
}

trace() {
  verbose && echo "$1"
}

tracevar() {
  if verbose ; then
    local var=
    local val=
    var=$1
    val=$(eval echo \$"$var")
    echo "${var}: $val"
  fi
}

debug && trace "Debug is on"
trace "Hello World"
tracevar ERRORS
# ERRORS=$((ERRORS+=1)) # darn ubuntu default dash shell
exit $ERRORS

# vim:sta:et:sw=2:ts=2:syntax=sh
