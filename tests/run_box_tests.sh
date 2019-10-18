#!/bin/bash

set -euox pipefail

# expected arguments: box_name provider distro

box_name=$1
provider=$2
distro=$3

function finish {
    vagrant destroy -f "${distro}" || :
    vagrant box remove --force --all --provider "${provider}" "${box_name}" || :
}

function run_tests {
    vagrant up "${distro}" --provider "${provider}"

    # ensure the box survives a reboot
    vagrant halt "${distro}"
    vagrant up "${distro}"

    vagrant destroy -f "${distro}"
}

trap finish EXIT

run_tests

# retry with static IPs
export BOX_STATIC_IP=1
run_tests
