#!/usr/bin/env bash
set -x

# Disable multiple kernel installs
sed -i 's/^multiversion/# multiversion/' \
  /etc/zypp/zypp.conf

exit 0
