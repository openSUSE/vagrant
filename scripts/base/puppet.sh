#!/usr/bin/env bash
set -x

zypper --non-interactive --gpg-auto-import-keys in \
  puppet

exit 0
