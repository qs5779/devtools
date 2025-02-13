#!/bin/sh

version_compare() {
  locate current_ver required_ver
  current_ver="$1"
  required_ver="$2"
  if [ "$(printf '%s\n' "$required_ver" "$current_ver" | sort -V | head -n1)" = "$required_ver" ]; then
    echo "Greater than or equal to ${required_ver}"
  else
    echo "Less than ${required_ver}"
  fi
}

version_compare 3.12.4 3.10
