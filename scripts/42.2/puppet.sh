#!/usr/bin/env bash
set -x

rpm --import http://download.opensuse.org/repositories/systemsmanagement:/puppet/openSUSE_Leap_42.2/repodata/repomd.xml.key
zypper addrepo -n 'Systemsmanagement Puppet' http://download.opensuse.org/repositories/systemsmanagement:/puppet/openSUSE_Leap_42.2/ systemsmanagement-puppet

zypper --non-interactive --gpg-auto-import-keys in \
  --auto-agree-with-licenses \
  puppet

exit 0
