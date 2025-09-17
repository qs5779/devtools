#!/bin/sh

version_compare() {
  locate current_ver required_ver
  current_ver="$1"
  required_ver="$2"
  if [ "$required_ver" = "$current_ver" ] ; then
    echo "${current_ver} equals ${required_ver}"
    return 0
  elif [ "$(printf '%s\n' "$required_ver" "$current_ver" | sort -V | head -n1)" = "$required_ver" ]; then
    echo "${current_ver} is greater than ${required_ver}"
    return 1
  fi
  echo "${current_ver} is Less than ${required_ver}"
  return 255
}

version_compare 1.0.0.dev2 1.0.0.dev1
