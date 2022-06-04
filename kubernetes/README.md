## Setup and overall plan for kubernetes clusters

* Sidero and Talos for full kubernetes infrastructure

No traditional Hypervisor or normal OS. k8s from control plane down.

Mac mini the control plane node
- external LB
- Cluster API host for Sidero?
- CI/CD host for running automation to cluster
- double duty for ARM worker node and AirPlay host for basement speakers

3 nodes in cluster are Sidero servers
- deployed with CAPI
- install/configure Ceph using [Rook](https://www.talos.dev/v1.0/kubernetes-guides/configuration/ceph-with-rook/)
- install all keys and setup for clustering

No Anisble or Pulumi for HW or VM configuration. Everything is done using CAPI and k8s using YAML configs in Git.

All gitOps based with CI/CD to deploy HW and software. Ceph storage and all k8s clusters on bare metal with PXE boot.

Interact with machines using only APIs, probably with Python scripts I write for whatever in the CI.