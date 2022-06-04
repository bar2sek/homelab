## VLAN Design

IoT
10.0.10.0/24

NoT (local only)
10.0.20.0/24

MGMT
10.0.30.0/24

VM
10.0.40.0/24

Proxmox Cluster (failover)
10.0.50.0/24

Ceph Public
10.0.60.0/24

Ceph Cluster
10.0.70.0/24

Work Network
10.0.80.0/24

Family Network
10.0.90.0/24

vpn.bar2sek.net
172.16.0.0/24

LAN
192.168.1.0/24

### -------------  v2  ---------------- 

| name         | wifi | vlan | ip         | devices                                                                                  |
|:------------:|:----:|:----:|:----------:|:----------------------------------------------------------------------------------------:|
| mgt          | no   | 1    | 10.10.1.x  | udmp usw access points                                                                   |
| dns          | no   | 5    | 10.10.5.x  | odroid (10.10.5.5) rpizero (10.10.5.6)                                                   |
| main         | yes  | 10   | 10.10.10.x | wired: desktops wifi: phones                                                             |
| iot          | yes  | 20   | 10.10.20.x | wired: nvidia shield denon AVR. wifi: nest thermostat roborock vacuum doorbell g4 (wifi) |
| iot-isolated | no   | 30   | 10.10.30.x | unifi cameras printer                                                                    |
| servers      | no   | 40   | 10.10.40.x | VMs                                                                                      |
| guest        | yes  | 50   | 10.10.50.x | wifi: nintendo switch guest phones                                                       |



## firewall rules
by default traffic is blocked from between internal networks (RFC1918), with the following exceptions

lan1 - management devices: udm pro, unifi switch poe, unifi access points
Allow all traffic from mgt LAN to any network

vlan5 - dns servers
Allow DNS requests from local networks to DNS servers
iptables NAT rules on the UDMP to redirect all DNS queries to the 2 DNS servers

vlan10 - trusted devices such as desktops, personal laptops
Allow Established/Related traffic from main VLAN to any network
Allow all traffic from main VLAN to iot VLAN (vlan 20)
Allow all traffic from main VLAN to iot-isolated VLAN (vlan 30)
Allow ssh (22) traffic from main VLAN to servers vlan (vlan 40)
Allow web (80, 443) traffic from main VLAN to servers vlan (vlan 40)
Allow plex (32400) traffic from main VLAN to servers vlan (vlan 40)
Allow smb/nfs traffic from VLAN to servers vlan (vlan 40)
Allow mumble (64738) traffic from main VLAN to servers vlan (vlan 40)

vlan20 - iot devices (with external access)
Allow Established/Related traffic from iot VLAN to any network
accept bonjour, mDNS, PTP, SSDP, Chromecast, Airplay, Steam Streaming from lan10
igmp allowed to any network
Allow plex (32400) traffic from iot VLAN to servers vlan (vlan 40)

vlan30 - iot devices (internal only - no external access)
Allow Established/Related traffic from iot-isolated VLAN to any network
Block traffic to external networks

vlan40 - servers
Allow Established/Related traffic from servers VLAN to any network

vlan50 - guest devices
wifi bandwith limits

## Diagram for physical network

## Diagram for logical network