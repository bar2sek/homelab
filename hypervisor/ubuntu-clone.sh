#!/usr/bin/env bash

CLONE_ID=$1
CLONE_NAME=$2

usage () {
    echo "Usage:"
    echo $0 "clone id and clone name"
    echo "Example:"
    echo $0 "135 master01"
}

if [[ -z "$CLONE_ID" ]]; then
    echo "Please specify the ID number of the new template to create (135)."
    usage
    exit 1
fi

if [[ -z "$CLONE_NAME" ]]; then
    echo "Please specify the name of the new template."
    usage
    exit 2
fi

qm template ${ID}

qm clone ${ID} ${CLONE_ID} --name ${CLONE_NAME}

qm set ${CLONE_ID} --sshkey ~/.ssh/id_rsa.pub \
 --ipconfig0 ip=dhcp # --ipconfig0 ip=10.0.10.123/24,gw=10.0.10.1

# -- Future enhancement: create cloud-init VMs all in one shot using vendor files and cicustom parameter -- #