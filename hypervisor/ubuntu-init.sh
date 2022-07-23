#!/usr/bin/env bash

ID=$1
MEMORY=$2
VM_NAME=$3
NETWORK=$4

usage () {
    echo "Usage:"
    echo $0 "ID Memory Name network"
    echo "Example:"
    echo $0 "8000 2048 ubuntu-init vm"
}

if [[ -z "$ID" ]]; then
    echo "Please specify the ID number of the new template to create (8000)."
    usage
    exit 1
fi

if [[ -z "$MEMORY" ]]; then
    echo "Please specify the amount of memory to create (2048)."
    usage
    exit 2
fi

if [[ -z "$VM_NAME" ]]; then
    echo "Please specify the name of the new VM template."
    usage
    exit 3
fi

if [[ -z "$NETWORK" ]]; then
    echo "Please specify the UniFi network to use (vm)."
    usage
    exit 4
fi

qm create ${ID} --memory ${MEMORY} --name ${VM_NAME} --net0 virtio,bridge=${NETWORK} --ipconfig0 ip=dhcp

# hard coded directories and names to work with my proxmox setup
qm importdisk ${ID} /mnt/pve/cephfs/template/iso/focal-server-cloudimg-amd64.img ceph_pool

qm set ${ID} --scsihw virtio-scsi-pci --scsi0 ceph_pool:vm-${ID}-disk-0 \
 --ide2 ceph_pool:cloudinit \
 --boot c --bootdisk scsi0 \
 --serial0 socket --vga serial0

echo "Complete. Please add users and ssh keys as needed via the Proxmox GUI."

#FIN
exit 0