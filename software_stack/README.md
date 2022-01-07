## Software layers

- Physical servers
- Proxmox hypervisor
- - pulumi controlled infrastructure as code managing VMs eventually?
- ClusterAPI nodes to command main kubernetes clusters
- - Argo and Actions to be source of truth for CAPI and all code
- services hosted on kubernetes