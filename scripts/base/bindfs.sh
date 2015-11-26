#!/usr/bin/env bash
set -x

zypper --non-interactive --gpg-auto-import-keys in \
  bindfs

exit 0
