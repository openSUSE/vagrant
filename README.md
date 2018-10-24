# Vagrant

This repository stores our [Packer](https://www.packer.io) definitions of various
versions of openSUSE for running [Vagrant](https://www.vagrantup.com).


## Tumbleweed

**Building**

```bash
packer build -parallel=false \
  -var iso_url=http://download.opensuse.org/tumbleweed/iso/openSUSE-Tumbleweed-NET-x86_64-Snapshot20160529-Media.iso \
  -var iso_checksum=324a29b9e1cb5fd3f3fb92a65681939fff66ec6cd735aeff555a2bd7d4d495f0 \
  definitions/tumbleweed-x86_64.json
```

**Downloads**

* Available at Atlas
  [x86_64](https://app.vagrantup.com/opensuse/boxes/openSUSE-Tumbleweed-x86_64)


## Leap 15.0

**Building**

```bash
packer build -parallel=false definitions/15.0-x86_64.json
```

**Downloads**

* Available at Atlas
  [x86_64](https://app.vagrantup.com/opensuse/boxes/openSUSE-15.0-x86_64)


## Leap 42.3

**Building**

```bash
packer build -parallel=false definitions/42.3-x86_64.json
```

**Downloads**

* Available at Atlas
  [x86_64](https://app.vagrantup.com/opensuse/boxes/openSUSE-42.3-x86_64)


## License

MIT


## Copyright

```
Copyright (c) 2015 The openSUSE Project <http://www.opensuse.org>
```
