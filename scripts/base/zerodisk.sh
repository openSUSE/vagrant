#!/usr/bin/env bash
set -x

rm -rf /var/cache/* /usr/share/doc/*

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

sync

exit 0
