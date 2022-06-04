## Initial setup and notes for my proxmox installations and cluster

### Node Plan

#### SuperMirco server machines
* part of main kubernetes cluster
* 10G network and NVMe/SSD drives for Ceph

#### AMD gaming PC
* native Windows dev and gaming environment
* All Supporting VMs in Hyper-V
    * Database
    * Load Balancer
    * Pihole for DNS
    * CI/CD runner
    * image and container repositories

### Backup strategy
* how and what to back up???
    * compress, encrypt and upload to offsite Synology
    * compress, encrypt and upload to Azure bucket or S3