# Hypervisor Layer

Proxmox 7.2

- Clusered with 3 SuperMirco nodes
- HA turned on for VM replication across nodes in case of failure
- Ceph hyperconvered storage across 3 SuperMicro nodes with 2x2TB disks eash
- Proxmox Backup Server on AMD node on Linux VM

### Initial Setup

1. Install pxmx using USB key
1. Ensure proper network port is enabled in the MGMT network on Unifi router and in documented port
1. Use ZFS or btrfs RAID 1 across two small drives for boot drive redundancy
1. Upon reboot, switch update repository to no-subscription and disable subscription
1. Install Ceph
1. Run `apt update` and `apt upgrade -y`
1. Reboot

### Add Clustering (live migration of VMs)

1. Setup cluster port and network
    - node > network > Create Linux Bridge > add IP/24 > add port name to use > optionally add Comment `pxmx-cluster`
1. Apply Changes
1. Main node > DataCenter > Cluster > Create Cluster
1. Add name `pxmx-cluster` and add second link for cluster network, ensure cluster network is Link 0 for higher priority.
1. Do the same process on other two nodes, but `Join Cluster` and select info from first node.

### Add High Availability (auto live migration of individual VMs in case of node failure)

1. Start with VM in a shut down state.
1. DataCenter > HA > Add > Select VM to have HA > Fill in fields and selected 'Started' for state.
1. VM should start when completed as specified. 

### Setup Ceph Cluster

1. [Docs](https://pve.proxmox.com/wiki/Deploy_Hyper-Converged_Ceph_Cluster#pve_ceph_install_wizard)