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

### Internal DNS

Pihole

When using multiple VLANS, must set in the pi-hole web gui in Settings under Interface settings check box from "Allow only local requests to Bind only" to "Bind only to interface ethXYZ" hit save and the problem went away.

✅ Install servers in rack
☑️ Diagram network [Architecture](https://www.microsoft.com/en-us/microsoft-365/business-insights-ideas/resources/tips-for-mapping-your-network-diagram)
✅ Create networks in Unifi
☑️ Create [Firewall rules](https://help.ui.com/hc/en-us/articles/115003173168-UniFi-UDM-USG-Introduction-to-Firewall-Rules#4) and [MGMT network](https://help.ui.com/hc/en-us/articles/115010254227-UniFi-USG-Firewall-How-to-Disable-InterVLAN-Routing#option%203)