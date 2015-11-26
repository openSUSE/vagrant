#!/usr/bin/env bash
set -x

zypper --non-interactive --gpg-auto-import-keys in \
  https://opscode-omnibus-packages.s3.amazonaws.com/el/7/x86_64/chefdk-0.10.0-1.el7.x86_64.rpm

exit 0
