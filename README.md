# Vagrant

This repository stores our [Packer](https://www.packer.io) definitions of various
versions of openSUSE for running [Vagrant](https://www.vagrantup.com).


## Tumbleweed

**Building**

```bash
packer build -parallel=false -var iso_url=URL -var iso_checksum=CHECKSUM definitions/tumbleweed-x86_64.json
```

**Downloads**

* Virtualbox
  [x86_64](http://download.opensuse.org/vagrant/openSUSE-Tumbleweed-virtualbox-x86_64-1.0.0.box)
* Libvirt/KVM
  [x86_64](http://download.opensuse.org/vagrant/openSUSE-Tumbleweed-libvirt-x86_64-1.0.0.box)
* Also available at Atlas
  [x86_64](https://atlas.hashicorp.com/opensuse/boxes/openSUSE-Tumbleweed-x86_64)


## Leap

**Building**

```bash
packer build -parallel=false definitions/42.1-x86_64.json
```

**Downloads**

* Virtualbox
  [x86_64](http://download.opensuse.org/vagrant/openSUSE-42.1-virtualbox-x86_64-1.0.0.box)
* Libvirt/KVM
  [x86_64](http://download.opensuse.org/vagrant/openSUSE-42.1-libvirt-x86_64-1.0.0.box)
* Also available at Atlas
  [x86_64](https://atlas.hashicorp.com/opensuse/boxes/openSUSE-42.1-x86_64)


## openSUSE 13.2

**Building**

```bash
packer build -parallel=false definitions/13.2-x86_64.json
packer build -parallel=false definitions/13.2-i586.json
```

**Downloads**

* Virtualbox
  [x86_64](http://download.opensuse.org/vagrant/openSUSE-13.2-virtualbox-x86_64-1.0.0.box)
  [i586](http://download.opensuse.org/vagrant/openSUSE-13.2-virtualbox-i586-1.0.0.box)
* Libvirt/KVM
  [x86_64](http://download.opensuse.org/vagrant/openSUSE-13.2-libvirt-x86_64-1.0.0.box)
  [i586](http://download.opensuse.org/vagrant/openSUSE-13.2-libvirt-i586-1.0.0.box)
* Also available at Atlas
  [x86_64](https://atlas.hashicorp.com/opensuse/boxes/openSUSE-13.2-x86_64)
  [i586](https://atlas.hashicorp.com/opensuse/boxes/openSUSE-13.2-i586)


## openSUSE 13.1

**Building**

```bash
packer build -parallel=false definitions/13.1-x86_64.json
packer build -parallel=false definitions/13.1-i586.json
```

**Downloads**

* Virtualbox
  [x86_64](http://download.opensuse.org/vagrant/openSUSE-13.1-virtualbox-x86_64-1.0.0.box)
  [i586](http://download.opensuse.org/vagrant/openSUSE-13.1-virtualbox-i586-1.0.0.box)
* Libvirt/KVM
  [x86_64](http://download.opensuse.org/vagrant/openSUSE-13.1-libvirt-x86_64-1.0.0.box)
  [i586](http://download.opensuse.org/vagrant/openSUSE-13.1-libvirt-i586-1.0.0.box)
* Also available at Atlas
  [x86_64](https://atlas.hashicorp.com/opensuse/boxes/openSUSE-13.1-x86_64)
  [i586](https://atlas.hashicorp.com/opensuse/boxes/openSUSE-13.1-i586)


## License

MIT


## Copyright

```
Copyright (c) 2015 The openSUSE Project <http://www.opensuse.org>
```
