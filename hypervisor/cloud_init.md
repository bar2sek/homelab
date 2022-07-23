# Using Cloud-Init with an Ubuntu Cloud image in Proxmox

## chmod +x and sudo run the ubuntu-init.sh script to do these steps until #9.

## Manual cloud-init setup in Proxmox
credit: [Techno Tim](https://www.youtube.com/watch?v=shiIi38cJe4), [his github](https://github.com/techno-tim/techno-tim.github.io/blob/8f97952ee1c511d543af05ec3a2a6f835790b7fe/_posts/2022-03-19-cloud-init-cloud-image.md), [docs](https://pve.proxmox.com/pve-docs/qm.1.html)

1. Download Ubuntu cloud image to Proxmox CephFS > ISO Images on main pxmx node.
1. Login to main pxmx node through local terminal.
1. Create new VM
    * `sudo qm create 9000 --memory 2048 --name ubuntu-cloud --net0 virtio,bridge=vm --ipconfig0 ip=dhcp`
1. Use the image file and create an unused storage drive for the VM in ceph_pool where all my other VM disks are stored
    * `sudo qm importdisk 9000 /mnt/pve/cephfs/template/iso/focal-server-cloudimg-amd64.img ceph_pool`
        * `transferred 2.2 GiB of 2.2 GiB (100.00%)`
        * `Successfully imported disk as 'unused0:ceph_pool:vm-9000-disk-0'`
1. Attach the new disk to the vm as a scsi drive on the scsi controller interface
    * `sudo qm set 9000 --scsihw virtio-scsi-pci --scsi0 ceph_pool:vm-9000-disk-0`
        * `update VM 9000: -scsi0 ceph_pool:vm-9000-disk-0 -scsihw virtio-scsi-pci`
1. Add cloud init logical drive
    * `sudo qm set 9000 --ide2 ceph_pool:cloudinit`
        * `update VM 9000: -ide2 ceph_pool:cloudinit`
        * `ide2: successfully created disk 'ceph_pool:vm-9000-cloudinit,media=cdrom'`
1. Make the cloud init drive bootable and restrict BIOS to boot from disk only
    * `sudo qm set 9000 --boot c --bootdisk scsi0`
        * `update VM 9000: -boot c -bootdisk scsi0`
1. Add serial console
    * `sudo qm set 9000 --serial0 socket --vga serial0`
        * `update VM 9000: -serial0 socket -vga serial0`
    * Now you have a Cloud-Init option in the GUI when you select VM 9000!
    ### DO NOT START THE VM
1. Configure hardware and cloud init so it'll use those values when it boots for the first time, then create a template and clone. If you want to expand your hard drive you can on this base image before creating a template or after you clone a new machine. I prefer to expand the hard drive after I clone a new machine based on need.
1. Create a user for the potential VM
    * add user ryan.
    * copy in id_rsa.pub from local Mac to public key field.
    * change hardware as you need.
    * Any other additions for software etc, should be done with Ansible once the VM is created from this.
1. Create template.
    * `sudo qm template 9000`
        * `Creating snap: 100% complete...done.`
1. Clone template to a VM and add options.
    * `sudo qm clone 9000 135 --name test --full`
1. Start newly created VM