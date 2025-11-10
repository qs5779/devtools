#!/bin/bash

while IFS= read -r -d '' fn ; do
  if [ -f "$fn" ] ; then
    echo "$fn"
  fi
done <   <(find . -type f -print0)
