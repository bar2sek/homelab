## Setup and overall plan for kubernetes clusters

* k3os with Rancher?
* TalOS with kubeadm?

cloud-init Master and Worker VMs for use in Proxmox on all 3 servers? Use Ceph for storage across them and another smaller machine for independant things like LB? Use PC for backup machine and not in Ceph cluster.

I don't need a BOSH like lifecycle manager for the VMs, there will only be a few that I can monitor. They run k8s and the work that does is what's important. I can set alerts for the VMs themselves. Automate it with pulumi or Terraform so a poor man's bosh to recover the VMs should be fine.

Therefore no need for vSphere or VMW products of any kind.
Can always use TAP on top of my k8s if desired.

Mac mini the control plane node
- external LB
- Cluster API host for Sidero/Tanzu?
- MAAS host for re-imaging hardware nodes
- CI/CD host for running automation to cluster
- double duty for ARM worker node and AirPlay host for basement speakers

3 nodes in cluster are Ubuntu servers
- deployed using MAAS + cloud-init
- install/configure Ceph
- install all keys and setup for clustering
- install qemu for Sidero/Talos VMs?

Other option is to skip Ubuntu and go straight to Sidero? How to do storage then?

Instead of worrying about a Hypervisor APIs with Pulumi or suome such, use Ansible to configure VMs from CI/CD if needed?