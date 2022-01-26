# homelab
scripts, documentation, and diagrams for my personal home lab

## Infrastructure

* 2x 8 core SuperMicro edge servers 32Gb RAM + 10G networking
* 1x 28 core SuperMicro server 160Gb RAM + 10G networking
* 1x 24 core AMD Ryzen 

Networking

* 24 port 1Gb Unifi switch
* 8 port 10Gb Unifi switch
* 2x Unifi WAPs
* Unifi Dream Machine Pro router
    * IPS
    * DDNS
    * VPN RADIUS server
    * unifi controller
    * DHCP
    * VLANs

## Platform

### Proxmox Hypervisor running Ubuntu server VMs to build a kubeadm cluster with ceph storage.

Getting Started:
* [Kubernetes Production Environment](https://kubernetes.io/docs/setup/production-environment/)
* [Bootstrapping clusters with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/)

Ceph distributed storage
* [rbd](https://kubernetes.io/docs/concepts/storage/volumes/#rbd)
* [Rook](https://rook.io/)
* [Manually Mount a Ceph Storage Pool in Proxmox](https://www.jamescoyle.net/how-to/1253-manually-mount-a-ceph-storage-pool-in-proxmox)
* [Simple 3 node Ceph Cluster](https://www.jamescoyle.net/how-to/1244-create-a-3-node-ceph-storage-cluster)

Hardened k8s OS
* [Talos Linux](https://www.talos.dev)
* [Proxmox Doc](https://www.talos.dev/docs/v0.14/virtualized-platforms/proxmox/#installation)

Control Plane
* [Cluster API](https://cluster-api.sigs.k8s.io/introduction.html)
* [Operating CAPI](https://www.youtube.com/watch?v=8yUDUhZ6ako&t=600s)

Reverse Proxy, LB, Ingress, API gateway
* [Traefik](https://doc.traefik.io/traefik/providers/kubernetes-ingress/)
* [MetalLB](https://metallb.universe.tf/installation/)
    * [Setting up in proxmox](https://canthonyscott.com/setting-up-a-k3s-kubernetes-cluster-within-proxmox/)
* [LAN reverse proxy](https://pve.proxmox.com/wiki/Web_Interface_Via_Nginx_Proxy)

DNS
* [pihole](https://pi-hole.net)

SSO
* [Authelia](https://www.authelia.com/docs/)

Code repo and Continuous Integration
* [GitHub](https://github.com)
* [GitHub Actions](https://github.com)

gitOps and Continuous Delivery 
* [argoCD](https://argo-cd.readthedocs.io/en/stable/)
    * [Create and Manage Kubernetes Clusters with Cluster API and ArgoCD](https://piotrminkowski.com/2021/12/03/create-kubernetes-clusters-with-cluster-api-and-argocd/)
* [Helm](https://helm.sh)

Infrastructure as Code
* [Terraform cloud-init](https://learn.hashicorp.com/tutorials/terraform/cloud-init)
* [Terraform with proxmox](https://austinsnerdythings.com/2021/09/01/how-to-deploy-vms-in-proxmox-with-terraform/)
* [pulumi](https://www.pulumi.com/docs/)

Image registry
* [Harbor](https://goharbor.io/)
* [GitHub Packages](https://github.com)

Secret Store
* [Vault](https://www.vaultproject.io/)

Service Mesh
* [istio](https://istio.io/)

Database HA
* [MySQL] for etcd and NextCloud?

Observability
* [Prometheus](https://prometheus.io/)
* [Grafana](https://grafana.com/)

Backups
* [Proxmox Backup Server](https://www.proxmox.com/en/proxmox-backup-server)

## Hosted services

* NextCloud
    * MySQL
    * Nginx Webserver
* Home Assistant
* Bitwarden


## Future Enhancement with cloud-init VMs

1. Get basic cloud-init code that works with Proxmox for the VM template you want to build.
1. Get networking and auth figured out to have GitHub Actions push code back to on-prem proxmox API on the cluster.
1. Test on proxmox cluster.

## Path to Production

✅ Install servers in rack
☑️ Diagram network [Architecture](https://www.microsoft.com/en-us/microsoft-365/business-insights-ideas/resources/tips-for-mapping-your-network-diagram)
✅ Create networks in Unifi
☑️ Create [Firewall rules](https://help.ui.com/hc/en-us/articles/115003173168-UniFi-UDM-USG-Introduction-to-Firewall-Rules#4) and [MGMT network](https://help.ui.com/hc/en-us/articles/115010254227-UniFi-USG-Firewall-How-to-Disable-InterVLAN-Routing#option%203)