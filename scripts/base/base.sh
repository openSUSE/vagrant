#!/usr/bin/env bash
set -x

# Disable multiple kernel installs and recommended packages
sed -i -e 's/^multiversion/# multiversion/' \
  -e s'/#\?[[:space:]]*solver.onlyRequires.*/solver.onlyRequires = true/' \
  /etc/zypp/zypp.conf

exit 0
