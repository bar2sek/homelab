# Homelab
scripts, notes, documentation, and diagrams for my personal homelab

## Infrastructure Hardware

### Servers
* 2x 8 core SuperMicro edge servers 32Gb RAM
    * 2x 10G network
    * 4x 1G network
    * 1x 2TB nVme
    * 1x 2TB SATA SSD
* 1x 28 core SuperMicro server 160Gb RAM
    * 2x 10G network
    * 2x 1G network
    * 2x 2TB SATA SSD
* 1x 24 core AMD Ryzen
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
* 2x Unifi WAPs

## Platform

* [Sidero Metal](https://www.sidero.dev/) for server provisioning and lifecycle management using [Talos Linux](https://www.talos.dev/) for immutable and minimal kubernetes native OS on each node.

External dDNS, Reverse Proxy, Zero Trust Tunnel, and Registrar
* [CloudFlare](https://dash.cloudflare.com/f)

Control plane node (AMD Ryzen)  
Fedora Linux for light gaming and Docker Desktop for kubernetes
* [MetalLB](https://metallb.universe.tf/installation/) external LB
* [Pihole](https://pi-hole.net) internal DNS
* [Traefik](https://doc.traefik.io/traefik/providers/kubernetes-ingress/) reverse proxy
* Cluster API host for [Crossplane](https://crossplane.io/) for keeping infra in sync
* [ArgoCD](https://argo-cd.readthedocs.io/en/stable/) for running automation to cluster
* Database of some sort??
* kubernetes backup using [K10](https://www.youtube.com/watch?v=01qcYSck1c4)

3 Sidero server cluster nodes (SuperMicro machines)   
* [Talos Linux](https://www.talos.dev/) clustered and operated by Sidero [Cluster API](https://cluster-api.sigs.k8s.io/)   
* [Rook](https://www.talos.dev/v1.0/kubernetes-guides/configuration/ceph-with-rook/) for distributed software defined storage

## Getting Started/Notes/Links:
* [Bare Metal Kubernetes](https://www.youtube.com/watch?v=XmgIlq2gEsg&t=781)
* [Sidero Setup](https://www.sidero.dev/v0.5/getting-started/prereq-kubernetes/)
* [Build Sidero Lab](https://itnext.io/build-kubernetes-clusters-using-sidero-metal-talos-linux-on-raspberry-pi-54a9961a7d4c)
* [Sidero Metal Webinar](https://www.youtube.com/watch?v=hPuu5mgIl2M)
* [Homelab with Sidero](https://www.youtube.com/watch?v=ZbXwTXSI9lk)

Ceph distributed storage
* [Rook with Talos](https://www.talos.dev/v1.0/kubernetes-guides/configuration/ceph-with-rook/)
* [Rook](https://rook.io/docs/rook/v1.9/ceph-storage.html)
* [Simple 3 node Ceph Cluster](https://www.jamescoyle.net/how-to/1244-create-a-3-node-ceph-storage-cluster)

SSO
* [Authelia](https://www.authelia.com/docs/)

Code repo and Continuous Integration
* [GitHub](https://github.com)
* [GitHub Actions](https://github.com)
* [Local Azure Pipelines Runner](https://www.youtube.com/watch?v=rO-VKProMp8)

gitOps Continuous Delivery + Infrastructure as Code
* [Create and Manage Kubernetes Clusters with Cluster API and ArgoCD](https://piotrminkowski.com/2021/12/03/create-kubernetes-clusters-with-cluster-api-and-argocd/)
* [Helm](https://helm.sh)
* [DevOps Toolkit argoCD + CrossPlane](https://www.youtube.com/watch?v=yrj4lmScKHQ&t=216s)

Image registry
* [Harbor](https://goharbor.io/)
* [GitHub Packages](https://github.com)

Secret Store
* [Vault](https://www.vaultproject.io/)

Service Mesh
* [istio](https://istio.io/)

Observability
* [Prometheus](https://prometheus.io/)
* [Grafana](https://grafana.com/)

Documentation
* [Hugo](https://gohugo.io/)

### Other services to run on kubernetes cluster
* [NextCloud](https://nextcloud.com/)
* [Home Assistant](https://www.home-assistant.io/)
* [Bitwarden](https://bitwarden.com/)