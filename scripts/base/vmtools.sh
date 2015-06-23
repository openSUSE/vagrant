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
    mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
    /mnt/VBoxLinuxAdditions.run --nox11
    umount /mnt

    rm -f /home/vagrant/VBoxGuestAdditions.iso
    ;;
esac

exit 0
