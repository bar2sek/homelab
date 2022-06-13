## Initial setup and notes for my proxmox installations and cluster

### Node Plan

#### SuperMirco server machines
* part of main kubernetes cluster
* 10G network and NVMe/SSD drives for Ceph

#### AMD gaming PC
* Fedora 36 for gaming
* Docker Desktop Cluster for off cluster services
    * Database
    * Load Balancer
    * Pihole for DNS
    * CI/CD runner
    * image and container repositories

### Backup strategy
* how and what to back up???
    * K10? [Nana video](https://www.youtube.com/watch?v=01qcYSck1c4&t=1s)