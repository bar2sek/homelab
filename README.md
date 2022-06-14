# Homelab
scripts, notes, documentation, and diagrams for my personal homelab

## Infrastructure

* 2x 8 core SuperMicro edge servers 32Gb RAM + 2x 10G networking each
* 1x 28 core SuperMicro server 160Gb RAM + 2x 10G networking
* 1x 24 core AMD Ryzen + 2x 10G networking

Networking

* 24 port 1Gb Unifi switch
* 8 port 10Gb Unifi switch
* 8 port PoE 1Gb Unifi switch
* 2x Unifi WAPs
* Unifi Dream Machine Pro router
    * IPS protection
    * unifi controller
    * VLAN management

## Platform

* [Sidero Metal](https://www.sidero.dev/) for server provisioning and lifecycle management and [Talos Linux](https://www.talos.dev/) for immutable and minimal kubernetes native OS on each node.

Control plane node
- external LB
- internal DNS
- reverse proxy
- Cluster API host for Sidero/Crossplane for keeping infra in sync
- ArgoCD for running automation to cluster

3 Sidero server cluster nodes
- deployed with CAPI using Crossplane
- install/configure Ceph using [Rook](https://www.talos.dev/v1.0/kubernetes-guides/configuration/ceph-with-rook/)
- install all keys and setup for clustering

Getting Started:
* [Bare Metal Kubernetes](https://www.youtube.com/watch?v=XmgIlq2gEsg&t=781)

### Setup
* [Setup](https://www.sidero.dev/v0.5/getting-started/prereq-kubernetes/)
* [Build Sidero Lab](https://itnext.io/build-kubernetes-clusters-using-sidero-metal-talos-linux-on-raspberry-pi-54a9961a7d4c)
* [Sidero Metal Webinar](https://www.youtube.com/watch?v=hPuu5mgIl2M)
* [Homelab with Sidero](https://www.youtube.com/watch?v=ZbXwTXSI9lk)

Ceph distributed storage
* [Rook with Talos](https://www.talos.dev/v1.0/kubernetes-guides/configuration/ceph-with-rook/)
* [Rook](https://rook.io/docs/rook/v1.9/ceph-storage.html)
* [Simple 3 node Ceph Cluster](https://www.jamescoyle.net/how-to/1244-create-a-3-node-ceph-storage-cluster)

Hardened k8s OS
* [Talos Linux](https://www.talos.dev)

Control Plane
* [Cluster API](https://cluster-api.sigs.k8s.io/introduction.html)
* [Operating CAPI](https://www.youtube.com/watch?v=8yUDUhZ6ako&t=600s)

Reverse Proxy, LB, Ingress, API gateway
* [Traefik](https://doc.traefik.io/traefik/providers/kubernetes-ingress/)
* [MetalLB](https://metallb.universe.tf/installation/)

External DNS, Proxy, Tunnels, and Registrar
* [CloudFlare](https://dash.cloudflare.com/f)

DNS
* [pihole](https://pi-hole.net)
    * [FTLDNS](https://docs.pi-hole.net/guides/dns/unbound/)
    * [DNS-Over-HTTPS](https://docs.pi-hole.net/guides/dns/cloudflared/)
    * [WireGuard](https://docs.pi-hole.net/guides/vpn/wireguard/concept/)
    * [Dynamic DNS](https://docs.pi-hole.net/guides/vpn/openvpn/dyndns/)
    * [PiHole Sync](https://www.youtube.com/watch?v=IFVYe3riDRA&t=196s)

SSO
* [Authelia](https://www.authelia.com/docs/)

Code repo and Continuous Integration
* [GitHub](https://github.com)
* [GitHub Actions](https://github.com)
* [Local Azure Pipelines Runner](https://www.youtube.com/watch?v=rO-VKProMp8)

gitOps Continuous Delivery + Infrastructure as Code
* [Create and Manage Kubernetes Clusters with Cluster API and ArgoCD](https://piotrminkowski.com/2021/12/03/create-kubernetes-clusters-with-cluster-api-and-argocd/)
    * [argoCD](https://argo-cd.readthedocs.io/en/stable/)
* [Helm](https://helm.sh)
* [DevOps Toolkit argoCD + CrossPlane](https://www.youtube.com/watch?v=yrj4lmScKHQ&t=216s)
    * [CrossPlane](https://crossplane.io/)

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

Documentation
* [Hugo](https://gohugo.io/)

Backups
* [K10?](https://www.youtube.com/watch?v=01qcYSck1c4)

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