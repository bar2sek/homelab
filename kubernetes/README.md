# Kubernetes


## Setting up talos k8s on proxmox
1. Create an external load balancer?
1. Create 1 control plane VM and 2 worker VMs on each node, give at least 2 cores, VM network, all else default.
1. Turn on each VM and get IPs from all nodes created. 
1. ... follow [video](https://www.youtube.com/watch?v=iEFb2Zg4xUg&t=442s) to fill in the gaps for a HA cluster.
* to set kubectl after below instructions, `export KUBECONFIG=kubeconfig` then can run `kubectl get nodes` 🙂

## Resources
[talos on proxmox setup](https://www.talos.dev/v1.0/talos-guides/install/virtualized-platforms/proxmox/)
[DevOps Toolkit](https://www.youtube.com/watch?v=iEFb2Zg4xUg&t=442s)