#!/usr/bin/env bash

declare -a options=()
declare -a dirs=()

# get options and dirs
for arg; do
  case "${arg}" in
    -*) options+=("${arg}");;
     *) dirs+=("${arg%/*}");;
  esac
done

# run validator for each unique dir
for dir in "${dirs[@]}"; do
  echo "${dir}"
done \
| sort -u \
| while read -r; do
  terraform validate "${options[@]}" "${REPLY}"
done
