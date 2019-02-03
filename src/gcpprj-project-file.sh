#!/usr/bin/env bash

find_project_file() {
  local root="$1"
  while ! [[ "$root" =~ ^//[^/]*$ ]]; do
    if [ -f "${root}/$GCPPRJ_PROJECT_FILE_NAME" ]; then
      echo "${root}/$GCPPRJ_PROJECT_FILE_NAME"
      return 0
    fi
    [ -n "$root" ] || break
    root="${root%/*}"
  done
  return 1
}




