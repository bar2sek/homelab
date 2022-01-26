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

Hardened k8s OS
* [Talos Linux](https://www.talos.dev)
* [Proxmox Doc](https://www.talos.dev/docs/v0.14/virtualized-platforms/proxmox/#installation)

Reverse Proxy, LB, Ingress, API gateway
* [Traefik](https://doc.traefik.io/traefik/providers/kubernetes-ingress/)

DNS
* [pihole](https://pi-hole.net)

SSO
* [Authelia](https://www.authelia.com/docs/)

Code repo and CI
* [GitHub](https://github.com)
* [GitHub Actions](https://github.com)

gitOps and CD
* [argoCD](https://argo-cd.readthedocs.io/en/stable/)
* [Helm](https://helm.sh)

Image repos
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