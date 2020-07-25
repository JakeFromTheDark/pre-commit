#!/usr/bin/env bash

declare playbook
declare output=
declare retcode=0

for playbook; do
  output="$(ansible-playbook -i localhost, --syntax-check -- "${playbook}" 2>&1)" && continue

  # failed
  retcode=$?
  echo "Playbook: ${playbook}"
  grep -v '^ \[WARNING\]: Could not match supplied host pattern, ignoring: ' <<<"${output}"
  echo
done

exit "${retcode}"
