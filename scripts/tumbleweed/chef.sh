#!/usr/bin/env bash
set -x

rpm --import http://download.opensuse.org/repositories/systemsmanagement:/chef:/12/openSUSE_Tumbleweed/repodata/repomd.xml.key
zypper addrepo -n 'Systemsmanagement Chef' http://download.opensuse.org/repositories/systemsmanagement:/chef:/12/openSUSE_Tumbleweed/ systemsmanagement-chef

zypper --non-interactive --gpg-auto-import-keys in \
  ruby2.2-rubygem-chef

exit 0
