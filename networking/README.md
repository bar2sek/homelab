## VLAN Design

| name         | wifi | speed | vlan | ip         | devices                                                                                  |
|:------------:|:----:|:----:|:----:|:----------:|:----------------------------------------------------------------------------------------:|
| MGMT          | no   | 1G | 10    | 10.10.10.0/24  | IPMI ports, Proxmox URLs                                                           
| IoT          | yes  | 1G | 20   | 10.10.20.0/24 | Work laptop, ecobee thermostat, guests |
| NoT | yes   | 1G   | 30 | 10.10.30.0/24 |  Cameras                                                                    |
| Ceph      | no   | 10G | 40   | 10.10.40.0/24 | Ceph Public Network
| VM | no   | 10G | 50   | 10.10.50.0/24 | kubernetes nodes                                                                    |
| pxmx Cluster | no   | 1G | 60   | 10.10.60.0/24 | Cluster network for proxmox                                                                    |
Default         | yes  | 1G | -   | 192.168.1.0/24 | wired: desktops wifi: phones  laptops                                                             |

## Firewall rules
by default traffic is blocked from between internal networks (RFC1918), with the following exceptions:

vlan10 - MGMT: Server IPMI ports, Proxmox mgmt URLs

vlan192 - Default: trusted devices such as desktops, personal laptops
Allow Established/Related traffic from VLAN to any network

vlan20 - IoT: Work devices, Guest Access (external only - no internal access)
Deny Established/Related traffic from VLAN to only the internet

vlan30 - NoT: devices (internal only - no external access)
Allow Established/Related traffic from VLAN to any network
Block traffic to external networks

vlan40 - Ceph: 10G
Allow Established/Related traffic from Ceph only to vlan50

vlan50 - VM: 10G
Allow Established/Related traffic from servers VLAN to any network

## Diagram for physical network

((placeholder))

## Diagram for logical network

((placeholder))

## Reverse Proxy Scheme

### External Reverse Proxy: CloudFlare

[Cloudflared with Tunnel and Access](https://noted.lol/say-goodbye-to-reverse-proxy-and-hello-to-cloudflare-tunnels/)

### Internal Reverse Proxy: Traefik

[Techo Tim video](https://www.youtube.com/watch?v=liV3c9m_OX8&t=524s)

## Internal DNS

### Pihole Config
1. Install Ubuntu 20.04 server with pihole name, install Openssh - 2 cores, 4GiB RAM, on VM network
1. `apt update` and `apt upgrade -y`
1. On pihole: `ssh-keygen` all defaults
1. On Mac: `ssh-keygen` all defaults
1. On Mac: `ssh-copy-id pihole@<piholeIP>` yes, password of pihole user on server.
1. On Mac: `alias pihole="ssh 'pihole@<piholeIP>'"`
1. Disable passworth auth on pihole
    1. `sudo nano /etc/ssh/sshd_config`
    1. Find `PasswordAuthentication yes`
    1. Uncomment line and edit to `no`
    1. `sudo systemctl restart ssh`
1. Enable HA on proxmox for pihole VM (DataCenter > HA > Add > Select VM)
1. Reserve IP and name to pihole in Unifi controller.
1. `curl -sSL https://install.pi-hole.net | bash`
1. Record admin password at conclusion of installation.
1. Login to admin UI
1. Settings > DNS > ✅ "Bind only to interface ethXYZ" to allow for mutlti-VLAN blocking.
1. Set DNS server in Unifi controller to pihole IP
1. On pihole: `nano /etc/resolv.conf`
    1. Change to `nameserver <VM network gateway IP>`
1. [Enable DNS-Over-HTTPS](https://docs.pi-hole.net/guides/dns/cloudflared/)
    * _NOTE:_ To manually change DNS provider, you must change file `/etc/default/cloudflared`


## References
[Firewall rules](https://help.ui.com/hc/en-us/articles/115003173168-UniFi-UDM-USG-Introduction-to-Firewall-Rules#4)