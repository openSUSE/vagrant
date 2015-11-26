#!/usr/bin/env bash
set -x

zypper --non-interactive --gpg-auto-import-keys in \
  --auto-agree-with-licenses \
  bindfs

exit 0
