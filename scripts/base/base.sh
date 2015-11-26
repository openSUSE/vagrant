#!/usr/bin/env bash
set -x

# Disable multiple kernel installs
sed -i 's/^multiversion/# multiversion/' \
  /etc/zypp/zypp.conf

# Remove virtualbox system packages
zypper --non-interactive rm \
  virtualbox-guest-tools \
  virtualbox-guest-x11 \
  virtualbox-guest-kmp-default \
  virtualbox-guest-kmp-desktop \
  virtualbox-guest-kmp-pae

exit 0
