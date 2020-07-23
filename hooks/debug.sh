#!/usr/bin/env bash

echo "DEBUG: Run with arguments:"
i=0
for arg; do
  i="$(( i + 1 ))"
  echo "  arg $i: ${arg}"
done

exit 0
