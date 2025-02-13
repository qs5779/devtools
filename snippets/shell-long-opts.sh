#!/bin/sh
# shellcheck shell=dash
# shellcheck disable=SC2034,SC2181
# Revision History:
# YYYYmmdd - whoami - initial version
#

SCRIPT=$(basename "$0")
VERSION='0.1.0'
VERBOSE=0
DEBUG=0
ERRORS=0

usage() {
  cat << EOM
usage: $SCRIPT [-d] [--debugfile file] [-h] [--minheap size] [--maxheap size] [-v] [-V]
  where:
    -d | --debug     => specify debug mode
         --debugfile => specify debugfile
    -h | --help      => show this message and exit
         --minheap   => specify minimum java heap size
         --maxheap   => specify maximum java heap size
    -v | --verbose   => add verbosity
    -V | --version   => show version and exit
EOM
  exit 1
}

# https://stackoverflow.com/questions/402377/using-getopts-to-process-long-and-short-command-line-options
# NOTE: This requires GNU getopt.  On Mac OS X and FreeBSD, you have to install this separately
TEMP=$(getopt -o dhvV --long debug,help,verbose,version,debugfile:,minheap:,maxheap: \
              -- "$@")

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

# echo "TEMP: $TEMP"
# # Note the quotes around '$TEMP': they are essential!
# eval set -- "$TEMP"

VERBOSE=false
DEBUG=false
MEMORY=
DEBUGFILE=
JAVA_MISC_OPT=
while true; do
  case "$1" in
    -h | --help ) usage ;;
    -V | --version ) echo "VERSION: $VERSION" ; exit ;;
    -v | --verbose ) VERBOSE=true; shift ;;
    -d | --debug ) DEBUG=true; shift ;;
    --debugfile ) DEBUGFILE="$2"; shift 2 ;;
    --minheap )
      JAVA_MISC_OPT="$JAVA_MISC_OPT -XX:MinHeapFreeRatio=$2"; shift 2 ;;
    --maxheap )
      JAVA_MISC_OPT="$JAVA_MISC_OPT -XX:MaxHeapFreeRatio=$2"; shift 2 ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

tracevar() {
  if [ $VERBOSE != false ]
  then
    local var val
    var=$1
    val=$(eval echo \$"$var")
    echo "${var}: $val"
  fi
}

for vv in VERBOSE DEBUG MEMORY DEBUGFILE JAVA_MISC_OPT
do
  tracevar "$vv"
done

exit

# vim:sta:et:sw=2:ts=2:syntax=sh
