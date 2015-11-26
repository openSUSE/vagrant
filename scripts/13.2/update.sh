#!/usr/bin/env bash
set -x

rm -f /etc/zypp/repos.d/*.repo

rpm --import http://download.opensuse.org/distribution/13.2/repo/oss/content.key
zypper addrepo -n 'openSUSE OSS' http://download.opensuse.org/distribution/13.2/repo/oss/ distro-oss

rpm --import http://download.opensuse.org/update/13.2/repodata/repomd.xml.key
zypper addrepo -n 'openSUSE OSS Update' http://download.opensuse.org/update/13.2/ distro-update-oss

rpm --import http://download.opensuse.org/distribution/13.2/repo/non-oss/content.key
zypper addrepo -n 'openSUSE Non-OSS' http://download.opensuse.org/distribution/13.2/repo/non-oss/ distro-non-oss

rpm --import http://download.opensuse.org/update/13.2-non-oss/repodata/repomd.xml.key
zypper addrepo -n 'openSUSE Non-OSS Update' http://download.opensuse.org/update/13.2-non-oss/ distro-update-non-oss

zypper --gpg-auto-import-keys --non-interactive ref
zypper --gpg-auto-import-keys --non-interactive dup

exit 0
