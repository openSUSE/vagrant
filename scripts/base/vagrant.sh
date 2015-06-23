#!/usr/bin/env bash
set -x

mkdir -pm 700 /home/vagrant/.ssh

wget --no-check-certificate \
  "https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub" \
  -O /home/vagrant/.ssh/authorized_keys

chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

mkdir -pm 744 /vagrant
chown -R vagrant /vagrant

if [ -d /etc/sudoers.d ]
then
  echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vagrant
  chmod 0440 /etc/sudoers.d/vagrant
else
  echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
fi

exit 0
