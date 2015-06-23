# Vagrant boxes

This repository stores our [Packer](https://www.packer.io) definitions of various
versions of openSUSE for running [Vagrant](https://www.vagrantup.com).


## Building

* Install packer from the [website](http://www.packer.io)
* ```packer build -parallel=false definitions/13.1-x86_64.json```
* ```packer build -parallel=false definitions/13.1-i586.json```
* ```packer build -parallel=false definitions/13.2-x86_64.json```
* ```packer build -parallel=false definitions/13.2-i586.json```
* ```packer build -parallel=false definitions/tumbleweed-x86_64.json```
* ```packer build -parallel=false definitions/tumbleweed-i586.json```


## Downloads

* openSUSE Tumbleweed
  * Virtualbox
    [x86_64](http://opensuse.org/opensuse-tumbleweed-virtualbox-x86_64-1.0.0.box)
    [i586](http://opensuse.org/opensuse-tumbleweed-virtualbox-i586-1.0.0.box)
  * Libvirt/KVM
    [x86_64](http://opensuse.org/opensuse-tumbleweed-libvirt-x86_64-1.0.0.box)
    [i586](http://opensuse.org/opensuse-tumbleweed-libvirt-i586-1.0.0.box)
  * Also available at [Atlas](https://atlas.hashicorp.com/opensuse)

* openSUSE 13.2
  * Virtualbox
    [x86_64](http://opensuse.org/opensuse-13.2-virtualbox-x86_64-1.0.0.box)
    [i586](http://opensuse.org/opensuse-13.2-virtualbox-i586-1.0.0.box)
  * Libvirt/KVM
    [x86_64](http://opensuse.org/opensuse-13.2-libvirt-x86_64-1.0.0.box)
    [i586](http://opensuse.org/opensuse-13.2-libvirt-i586-1.0.0.box)
  * Also available at [Atlas](https://atlas.hashicorp.com/opensuse)

* openSUSE 13.1
  * Virtualbox
    [x86_64](http://opensuse.org/opensuse-13.1-virtualbox-x86_64-1.0.0.box)
    [i586](http://opensuse.org/opensuse-13.1-virtualbox-i586-1.0.0.box)
  * Libvirt/KVM
    [x86_64](http://opensuse.org/opensuse-13.1-libvirt-x86_64-1.0.0.box)
    [i586](http://opensuse.org/opensuse-13.1-libvirt-i586-1.0.0.box)
  * Also available at [Atlas](https://atlas.hashicorp.com/opensuse)


## License

MIT


## Copyright

Copyright (c) 2015 The openSUSE Project <http://www.opensuse.org>
