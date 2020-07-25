#!/usr/bin/env bash

declare playbook
declare output=
declare retcode=0

declare color_red=$'\x1b[31m'
declare color_yellow=$'\x1b[1;33m'
declare color_normal=$'\x1b[0m'

for playbook; do
  output="$(ansible-playbook -i localhost, --syntax-check -- "${playbook}" 2>&1)" && continue

  # failed
  retcode="$?"
  echo    "${color_yellow}${playbook}:"
  echo -n "${color_red}"
  grep -v '^ \[WARNING\]: Could not match supplied host pattern, ignoring: ' <<<"${output}"
  echo -e "${color_normal}"
done

exit "${retcode}"
