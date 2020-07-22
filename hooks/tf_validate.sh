#!/usr/bin/env bash
set -e

echo "$@"
exit 2

declare -a paths
index=0

for file_with_path in "$@"; do
  paths[index]="$(dirname "${file_with_path}")"
  let "index+=1"
done

for path in "${paths[*]}"; do
  echo "${path}"
done \
| sort -u \
| while read; do
  terraform validate "${REPLY}"
  popd >/dev/null
done
