#!/usr/bin/env bash

set -eu

if ! type mail &>/dev/null; then
  echo "mail not found. Install it first!" >&2
  exit 10
elif [[ $# -ne 1 ]]; then
  echo "Usage: $0 <email@domain.tld>" >&2
  exit 22
else
  mail -s 'OpenSourceWebsite Test message' "$1" <<< 'It works!'
fi
