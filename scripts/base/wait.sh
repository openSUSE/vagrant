#!/usr/bin/env bash
set -x

RETRIES=7
DELAY=1
FACTOR=2
LOCKED=4

while true
do
  zypper --gpg-auto-import-keys --non-interactive install patch

  if [[ $? -ne $LOCKED ]]
  then
    exit $?
  fi

  if [[ $((RETRIES--)) -eq 0 ]]
  then
    echo >&2 "Tries exhausted"
    exit $LOCKED
  fi

  echo >&2 "Sleeping ${DELAY}s"
  sleep $DELAY

  DELAY=$((DELAY * FACTOR))
done
