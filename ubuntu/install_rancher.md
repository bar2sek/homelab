## Install Rancher on new install of ubuntu server

### NOTE: On Edge server add rocket drive first:

/dev/nvme0n1p1: UUID="fae7eb98-1967-4dbc-b8a4-9d9e11b02f1d" TYPE="ext4" PARTUUID="3d5e1715-09e3-7c4e-9f89-d22d5ae31d04"

Add below line to `/etc/fstab`:
* /dev/disk/by-uuid/fae7eb98-1967-4dbc-b8a4-9d9e11b02f1d /data ext4 defaults 0 0

### Install Docker on linux host
1. `curl https://releases.rancher.com/install-docker/20.10.sh | sh`
1. `sudo usermod -aG docker {username}

### Persist data and install Rancher
```shell
docker run -d --restart=unless-stopped \
  -p 80:80 -p 443:443 \
  -v /opt/rancher:/var/lib/rancher \
  --privileged \
  rancher/rancher:latest
```

