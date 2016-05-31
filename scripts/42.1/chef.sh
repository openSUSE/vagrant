#!/usr/bin/env bash
set -x

rpm --import http://download.opensuse.org/repositories/systemsmanagement:/chef:/12/openSUSE_Leap_42.1/repodata/repomd.xml.key
zypper addrepo -n 'Systemsmanagement Chef' http://download.opensuse.org/repositories/systemsmanagement:/chef:/12/openSUSE_Leap_42.1/ systemsmanagement-chef

zypper --non-interactive --gpg-auto-import-keys in \
  --auto-agree-with-licenses \
  ruby2.1-rubygem-chef

exit 0
