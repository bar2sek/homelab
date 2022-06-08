## VLAN Design

| name         | wifi | speed | vlan | ip         | devices                                                                                  |
|:------------:|:----:|:----:|:----:|:----------:|:----------------------------------------------------------------------------------------:|
| MGMT          | no   | 1G | 1    | 10.10.1.0/24  | udmp usw access points IPMI ports                                                                   |
| DNS          | no   | 1G | 5    | 10.10.5.0/24  | odroid (10.10.5.5) rpizero (10.10.5.6)                                                   |
| main         | yes  | 1G | 192   | 192.168.1.0/24 | wired: desktops wifi: phones  laptops                                                             |
| IoT          | yes  | 1G | 20   | 10.10.20.0/24 | wired: ? wifi: ecobee thermostat (wifi) |
| NoT | no   | 1G   | 30 | 10.10.30.0/24 | Sonos AMP?                                                                    |
| Server      | no   | 1G | 40   | 10.10.40.0/24 | Sidero server cluster
| Ceph Public | no   | 10G | 50   | 10.10.50.0/24 |                                                                     |
| Ceph Cluster | no   | 10G | 60   | 10.10.60.0/24 |                                                                     |
| vpn.bar2sek.com | no   | 1G | 172   | 172.16.0.0/24 | Personal External Access                                                                    |

## firewall rules
by default traffic is blocked from between internal networks (RFC1918), with the following exceptions

vlan1 - management devices: udm pro, unifi switch poe, unifi access points
Allow all traffic from mgt LAN to any network

vlan5 - dns servers
Allow DNS requests from local networks to DNS servers
iptables NAT rules on the UDMP to redirect all DNS queries to the 2 DNS servers

vlan192 - trusted devices such as desktops, personal laptops
Allow Established/Related traffic from main VLAN to any network
Allow all traffic from main VLAN to iot VLAN (vlan 20)
Allow all traffic from main VLAN to iot-isolated VLAN (vlan 30)
Allow ssh (22) traffic from main VLAN to servers vlan (vlan 40)
Allow web (80, 443) traffic from main VLAN to servers vlan (vlan 40)
Allow plex (32400) traffic from main VLAN to servers vlan (vlan 40)
Allow smb/nfs traffic from VLAN to servers vlan (vlan 40)
Allow mumble (64738) traffic from main VLAN to servers vlan (vlan 40)

vlan20 - IoT + Work devices (with external access)
Allow Established/Related traffic from iot VLAN to any network
accept bonjour, mDNS, PTP, SSDP, Chromecast, Airplay, Steam Streaming from lan10
igmp allowed to any network
Allow plex (32400) traffic from iot VLAN to servers vlan (vlan 40)

vlan30 - NoT devices (internal only - no external access)
Allow Established/Related traffic from iot-isolated VLAN to any network
Block traffic to external networks

vlan40 - servers
Allow Established/Related traffic from servers VLAN to any network

vlan50 and 60 - for Ceph software defined storage 10G

vlan172 - VPN network in Unifi

## Diagram for physical network

((placeholder))

## Diagram for logical network

((placeholder))

## Reverse Proxy Scheme

[Cloudflared with Tunnel and Access](https://noted.lol/say-goodbye-to-reverse-proxy-and-hello-to-cloudflare-tunnels/)