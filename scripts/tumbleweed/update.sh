#!/usr/bin/env bash
set -x

rm -f /etc/zypp/repos.d/*.repo

rpm --import http://download.opensuse.org/tumbleweed/repo/oss/content.key
zypper addrepo -n 'openSUSE OSS' http://download.opensuse.org/tumbleweed/repo/oss/ distro-oss

rpm --import http://download.opensuse.org/tumbleweed/repo/non-oss/content.key
zypper addrepo -n 'openSUSE Non-OSS' http://download.opensuse.org/tumbleweed/repo/non-oss/ distro-non-oss

RETRIES=7
DELAY=1
FACTOR=2
LOCKED=4

while true
do
  zypper --gpg-auto-import-keys --non-interactive ref

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

RETRIES=7
DELAY=1
FACTOR=2
LOCKED=4

while true
do
  zypper --gpg-auto-import-keys --non-interactive dup

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

exit 0
