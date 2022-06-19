## VLAN Design

| name         | wifi | speed | vlan | ip         | devices                                                                                  |
|:------------:|:----:|:----:|:----:|:----------:|:----------------------------------------------------------------------------------------:|
| MGMT          | no   | 1G | 1    | 10.10.1.0/24  | udmp usw access points IPMI ports                                                                   |                                                |
| default         | yes  | 1G | 192   | 192.168.1.0/24 | wired: desktops wifi: phones  laptops                                                             |
| IoT          | yes  | 1G | 20   | 10.10.20.0/24 | wired: ? wifi: ecobee thermostat (wifi) |
| NoT | no   | 1G   | 30 | 10.10.30.0/24 | ???                                                                    |
| Server      | no   | 10G | 40   | 10.10.40.0/24 | Sidero server cluster
| Ceph Public | no   | 10G | 50   | 10.10.50.0/24 | Software defined storage in Sidero cluster                                                                    |

## Firewall rules
by default traffic is blocked from between internal networks (RFC1918), with the following exceptions:

vlan1 - management devices: udm pro, unifi switch poe, unifi access points
Allow all traffic from mgmt LAN to any network

vlan5 - control plane
Allow Established/Related traffic from VLAN to any network

vlan192 - trusted devices such as desktops, personal laptops
Allow Established/Related traffic from VLAN to any network

vlan20 - IoT + Work devices (external only - no internal access)
Deny Established/Related traffic from VLAN to only the internet

vlan30 - NoT devices (internal only - no external access)
Allow Established/Related traffic from VLAN to any network
Block traffic to external networks

vlan40 - Kubernetes Cluster 10G
Allow Established/Related traffic from servers VLAN to any network

vlan50 - Storage 10G
Allow Established/Related traffic from Ceph only to vlan40

## Diagram for physical network

((placeholder))

## Diagram for logical network

((placeholder))

## Reverse Proxy Scheme

### External Reverse Proxy: CloudFlare

[Cloudflared with Tunnel and Access](https://noted.lol/say-goodbye-to-reverse-proxy-and-hello-to-cloudflare-tunnels/)

### Internal Reverse Proxy: Traefik

[Techo Tim video](https://www.youtube.com/watch?v=liV3c9m_OX8&t=524s)

✅ Install servers in rack
☑️ Diagram network [Architecture](https://www.microsoft.com/en-us/microsoft-365/business-insights-ideas/resources/tips-for-mapping-your-network-diagram)
✅ Create networks in Unifi
☑️ Create [Firewall rules](https://help.ui.com/hc/en-us/articles/115003173168-UniFi-UDM-USG-Introduction-to-Firewall-Rules#4) and [MGMT network](https://help.ui.com/hc/en-us/articles/115010254227-UniFi-USG-Firewall-How-to-Disable-InterVLAN-Routing#option%203)