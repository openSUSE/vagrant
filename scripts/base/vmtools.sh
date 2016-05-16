#!/usr/bin/env bash
set -x

case "$PACKER_BUILDER_TYPE" in
  vmware-iso|vmware-vmx)
    mount -o loop /home/vagrant/linux.iso /mnt
    tar xfz /mnt/VMwareTools-*.tar.gz -C /tmp/
    umount /mnt

    /tmp/vmware-tools-distrib/vmware-install.pl -d

    rm -rf /tmp/vmware*
    rm -f /home/vagrant/linux.iso
    ;;

  virtualbox-iso|virtualbox-ovf)
    zypper --non-interactive --gpg-auto-import-keys in \
      --auto-agree-with-licenses \
      virtualbox-guest-tools \
      virtualbox-guest-x11 \
      virtualbox-guest-kmp-default
    echo vboxsf >/etc/modules-load.d/vboxsf.conf
    ;;
esac

exit 0
