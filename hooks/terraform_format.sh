#!/usr/bin/env bash

declare -a options=()
declare -a dirs=()
declare retcode=0

# get options and dirs
for arg; do
  case "${arg}" in
    -*) options+=("${arg}");;
     *) dirs+=("${arg%/*}");;
  esac
done

# run formatter for each unique dir
while read -r; do
  terraform fmt "${options[@]}" "${REPLY}" || retcode=$?
done <<<"$(for dir in "${dirs[@]}"; do echo "${dir}"; done | sort -u)"

exit "${retcode}"
