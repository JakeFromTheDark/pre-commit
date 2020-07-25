#!/usr/bin/env bash

echo "DEBUG: Passed arguments:"
i=0
for arg; do
  i="$(( i + 1 ))"
  echo "  arg $i: ${arg}"
done
echo

exit 0
