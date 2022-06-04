## Initial setup and notes for my proxmox installations and cluster

* MAAS for automated deployment of Ubuntu server on HW
* cloud-init for automated deployment of VMs?

### Supporting VMs for on-prem clusters
* Database
* Load Balancer
* Pihole for DNS
* CI/CD runner
* image and container repositories

### Backup strategy
* Proxmox backup server VM on Windows Hyper-V
* compress, encrypt and upload to Azure bucket?
* compress, encrypt and upload to offsite Synology

### Node Plan

#### Edge machines
* part of main kubernetes cluster
* 10G network and NVMe/SSD drives for Ceph

#### Main machine
* part of main kubernetes cluster
* 10G network and NVMe/SSD drives for Ceph

#### AMD gaming PC
* native Windows and gaming environment
* Proxmox backup server VM on Windows Hyper-V