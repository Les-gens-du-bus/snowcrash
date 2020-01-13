#!/usr/bin/env sh

set -e

SNOWCRASH_ISO='SnowCrash.iso'
VM_NAME='snowcrash'

if virsh list --all --name | grep ${VM_NAME}; then
	virsh start ${VM_NAME}
	virt-viewer ${VM_NAME}
else
	virt-install \
		--name ${VM_NAME} \
		--memory 2048 \
		--vcpus 2 \
		--cdrom ${SNOWCRASH_ISO} \
		--livecd \
		--disk none \
		--network bridge=virbr0 \
		--os-variant ubuntu12.04
fi
