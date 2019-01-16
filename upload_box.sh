#!/bin/bash

set -eou pipefail

trigger_url=$1
user=$2
provider=$3

boxname=$(echo "${trigger_url}" | awk -F "/" '{print $NF}' | sed -e 's/\.json//' -e 's/aarch64-libvirt_aarch64/aarch64/')
source ~/vars/upload_env.sh
/usr/local/bin/uploader/box-releaser -vvvv "${trigger_url}" "${user}" "${provider}" --new-box-name "${boxname}"
