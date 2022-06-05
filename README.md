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

## Setup and overall plan for kubernetes clusters

* Sidero and Talos for full kubernetes infrastructure

No traditional Hypervisor or normal OS. k8s from control plane down.

Control plane node
- external LB
- Cluster API host for Sidero
- CI/CD host for running automation to cluster

3 nodes in cluster are Sidero servers
- deployed with CAPI
- install/configure Ceph using [Rook](https://www.talos.dev/v1.0/kubernetes-guides/configuration/ceph-with-rook/)
- install all keys and setup for clustering

No Anisble or Pulumi for HW or VM configuration. Everything is done using CAPI and k8s using YAML configs in Git.

All gitOps based with CI/CD to deploy HW and software. Ceph storage and all k8s clusters on bare metal with PXE boot.

Interact with machines using only APIs, probably with Python scripts I write for whatever in the CI.

Getting Started:
* [Kubernetes Production Environment](https://kubernetes.io/docs/setup/production-environment/)
* [Bare Metal Kubernetes](https://www.youtube.com/watch?v=XmgIlq2gEsg&t=781)
* [Bootstrapping clusters with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/)

Ceph distributed storage
* [rbd](https://kubernetes.io/docs/concepts/storage/volumes/#rbd)
* [Rook](https://rook.io/docs/rook/v1.9/ceph-storage.html)
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
* ???

## Hosted services

* NextCloud
    * MySQL
    * Nginx Webserver
* Home Assistant
* Bitwarden

## Path to Production

✅ Install servers in rack
☑️ Diagram network [Architecture](https://www.microsoft.com/en-us/microsoft-365/business-insights-ideas/resources/tips-for-mapping-your-network-diagram)
✅ Create networks in Unifi
☑️ Create [Firewall rules](https://help.ui.com/hc/en-us/articles/115003173168-UniFi-UDM-USG-Introduction-to-Firewall-Rules#4) and [MGMT network](https://help.ui.com/hc/en-us/articles/115010254227-UniFi-USG-Firewall-How-to-Disable-InterVLAN-Routing#option%203)