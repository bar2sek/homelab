## Initial setup and notes for my proxmox installations and cluster

* cloud-init for automated deployment of VMs?

### Supporting VMs for on-prem clusters
* Database
* Load Balancer
* Pihole for DNS

### Backup strategy

* Proxmox backup server VM on Windows Hyper-V

### Node Plan

#### Edge machines
* kubernetes worker VMs

#### Main machine
* master node
* additional worker nodes
* ClusterAPI nodes

#### AMD gaming PC
* native Windows and gaming environment
* Hyper-V VM for secondary master node
* Hyper-V VM for secondary ClusterAPI node
* Proxmox backup server