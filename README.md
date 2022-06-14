# Ryan's Homelab
scripts, notes, documentation, and diagrams for my personal homelab

## Infrastructure Hardware

### Servers
* 2x 8 core SuperMicro edge servers 32GB RAM
    * 2x 10G network
    * 4x 1G network
    * 1x 2TB nVme
    * 1x 2TB SATA SSD
* 1x 28 core SuperMicro server 160GB RAM
    * 2x 10G network
    * 2x 1G network
    * 2x 2TB SATA SSD
* 1x 24 core AMD Ryzen 64GB RAM
    * 2x 10G network
    * 1x 1G network
    * 4x 4TB HDD
    * 1x 1TB nVme
* Offsite Synology NAS
    * 2x 4TB HDD

### Networking
* Unifi Dream Machine Pro router
    * IPS protection
    * unifi controller
    * VLAN management
* 24 port 1Gb Unifi switch
* 8 port 10Gb Unifi switch
* 8 port PoE 1Gb Unifi switch
* 2x Unifi wireless access points

# Platform

* [Sidero Metal](https://www.sidero.dev/) for server provisioning and lifecycle management using [Talos Linux](https://www.talos.dev/) for immutable and minimal kubernetes native OS on each node.

External dDNS, Reverse Proxy, Zero Trust Tunnel, and Registrar
* [CloudFlare](https://dash.cloudflare.com/f)

Control plane node (AMD Ryzen)  
* [Fedora Linux](https://getfedora.org/en/workstation/) for OS and light gaming
* [Docker Desktop](https://www.docker.com/products/docker-desktop/) for control plane services over main cluster
    * [MetalLB](https://metallb.universe.tf/installation/) external LB
    * [Pihole](https://pi-hole.net) internal DNS
    * [Traefik](https://doc.traefik.io/traefik/providers/kubernetes-ingress/) reverse proxy
    * [Crossplane](https://crossplane.io/) infrastructure as code
    * [ArgoCD](https://argo-cd.readthedocs.io/en/stable/) deploying to cluster
    * Database of some sort??
    * [K10](https://www.youtube.com/watch?v=01qcYSck1c4) kubernetes backup

3 cluster nodes (SuperMicro machines)   
* [Talos Linux](https://www.talos.dev/) clustered and operated by Sidero [Cluster API](https://cluster-api.sigs.k8s.io/)   
* [Rook](https://www.talos.dev/v1.0/kubernetes-guides/configuration/ceph-with-rook/) for distributed software defined storage
    * [Harbor](https://goharbor.io/) image registry
    * [Vault](https://www.vaultproject.io/) secret store
    * [istio](https://istio.io/) application service mesh
    * [Prometheus](https://prometheus.io/)
    * [Grafana](https://grafana.com/) obvserability
    * [Hugo](https://gohugo.io/) documentation
    * [NextCloud](https://nextcloud.com/) personal cloud
    * [Home Assistant](https://www.home-assistant.io/)
    * [Bitwarden](https://bitwarden.com/) off-grid pw manager
    * [Authelia](https://www.authelia.com/docs/) hosted SSO?
    * [Helm](https://helm.sh)

## Getting Started/Notes/Links:
* [Bare Metal Kubernetes](https://www.youtube.com/watch?v=XmgIlq2gEsg&t=781)
* [Sidero Setup](https://www.sidero.dev/v0.5/getting-started/prereq-kubernetes/)
* [Build a Sidero Lab](https://itnext.io/build-kubernetes-clusters-using-sidero-metal-talos-linux-on-raspberry-pi-54a9961a7d4c)
* [Sidero Metal Webinar](https://www.youtube.com/watch?v=hPuu5mgIl2M)
* [Homelab with Sidero](https://www.youtube.com/watch?v=ZbXwTXSI9lk)

Ceph distributed storage
* [Rook with Talos](https://www.talos.dev/v1.0/kubernetes-guides/configuration/ceph-with-rook/)
* [Rook](https://rook.io/docs/rook/v1.9/ceph-storage.html)
* [Simple 3 node Ceph Cluster](https://www.jamescoyle.net/how-to/1244-create-a-3-node-ceph-storage-cluster)

gitOps Continuous Delivery + Infrastructure as Code
* [Create and Manage Kubernetes Clusters with Cluster API and ArgoCD](https://piotrminkowski.com/2021/12/03/create-kubernetes-clusters-with-cluster-api-and-argocd/)
* [DevOps Toolkit argoCD + CrossPlane](https://www.youtube.com/watch?v=yrj4lmScKHQ&t=216s)