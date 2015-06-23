#!/usr/bin/env bash
set -x

rm -f /etc/zypp/repos.d/*.repo

rpm --import http://download.opensuse.org/tumbleweed/repo/oss/content.key
zypper addrepo -n 'openSUSE OSS' http://download.opensuse.org/tumbleweed/repo/oss/ distro-oss

rpm --import http://download.opensuse.org/tumbleweed/repo/non-oss/content.key
zypper addrepo -n 'openSUSE Non-OSS' http://download.opensuse.org/tumbleweed/repo/non-oss/ distro-non-oss

zypper --gpg-auto-import-keys --non-interactive ref
zypper --gpg-auto-import-keys --non-interactive dup

exit 0
