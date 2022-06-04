## Setup and overall plan for kubernetes clusters

* k3os with Rancher?
* TalOS with kubeadm?

cloud-init Master and Worker VMs for use in Proxmox on all 3 servers? Use Ceph for storage across them and another smaller machine for independant things like LB? Use PC for backup machine and not in Ceph cluster.

I don't need a BOSH like lifecycle manager for the VMs, there will only be a few that I can monitor. They run k8s and the work that does is what's important. I can set alerts for the VMs themselves. Automate it with pulumi or Terraform so a poor man's bosh to recover the VMs should be fine.

Therefore no need for vSphere or VMW products of any kind.
Can always use TAP on top of my k8s if desired.

Mac mini the control plane node
- external LB
- Cluster API host for Sidero?
- CI/CD host for running automation to cluster
- double duty for ARM worker node and AirPlay host for basement speakers

3 nodes in cluster are Sidero servers
- deployed with CAPI
- install/configure Ceph using [Rook](https://www.talos.dev/v1.0/kubernetes-guides/configuration/ceph-with-rook/)
- install all keys and setup for clustering

No Anisble or Pulumi for HW or VM configuration. Everything is done using CAPI and k8s.

All gitOps based with CI/CD to deploy HW and software. Ceph storage and all k8s clusters on bare metal with PXE boot.

Interact with machines using only APIs, probably with Python scripts I write for whatever in the CI.