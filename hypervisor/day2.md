# Day 2 Operations for secure servers 🙂

## Secure SSH

### Create a seperate user

`useradd <username> -m -s /bin/bash`

Add the user to any administrative groups

`usermod -aG sudo,adm <username>`

Make a strong password for them

`passwd <username>`

## Disable Root Login and password Auth
It’s also a good idea to disable the root login and force all users to authenticate with private and public keys.

1. `apt update` and `apt upgrade -y`
1. On server with user ryan `ssh-keygen` all defaults
1. On : `ssh-keygen` all defaults
1. On : `ssh-copy-id ryan@<serverIP>` yes, password of pihole user on server.
1. On : `alias server="ssh 'ryan@<serverIP>'"`

## Disable password auth on server
1. Change these two lines in the `/etc/ssh/sshd_config` file.
    ```yaml
    # Authentication:
    PermitRootLogin no

    # To disable tunneled clear text passwords, change to no here and uncomment.
    PasswordAuthentication no
    ```
1. `sudo systemctl restart ssh`

## Updates

`sudo apt full-upgrade`

`sudo apt install unattended-upgrades`

`sudo dpkg-reconfigure --priority=low unattended-upgrades`

# Simple IPS

`sudo apt install fail2ban`

`sudo systemctl enable fail2ban --now`

`sudo fail2ban-client status`

`sudo fail2ban-client status sshd`