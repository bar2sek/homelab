## Techno Tim Linux setup and security hardening of Ubuntu VM

### Install and Update
1. Install ubuntu server
1. Update with `sudo apt-get update` then `sudo apt-get upgrade`

### Configure Automatic Updates
1. `sudo apt-get install unattended-upgrades`
1. `sudo dpkg-reconfigure --priority=low unattended-upgrades`
1. `Yes` at the "graphical" prompt for Automatically downloading stable updates
1. Check it with `sudo vi /etc/apt/apt.conf.d/20auto-upgrades`
  * don't want auto reboot, and want both to be "1"

### (Optional) Create a New User Account
1. `sudo adduser {new account}`
  * create password
  * add additional info
1. Add new user to sudoers list with `sudo usernmod -aG sudo {new account}`
1. Verify with `sudo -l -U {new account}` has "(ALL : ALL) ALL"
1. Disable root user with `grep root /etc/passwd` to view it.
1. `sudo passwd -l root` to disable logins for root.

### Install SSH server and configure key-based auth
1. `sudo apt-get update`
1. `sudo apt-get install openssh-server`
1. On the new server: `ssh-keygen`
1. On client machine: `ssh-keygen`
  * copy key to server using `ssh-copy-id {username}@{IP of server}`
  * enter password for {username} on {server}
1. Create alias on client machine for ease of use: `alias {username} ssh {username}@{IP of server}`
  * for edge machine mine is `edge-rancher`
1. Disable password based auth `sudo vi /etc/ssh/sshd_config`
  * uncomment `PasswordAuthentication yes`
  * restart ssh service `sudo systemctl restart ssh`
1. Reserve IP address of server in DHCP server.

### Configure firewall
1. `sudo ufw status`
1. `sudo ufw default allow outgoing`
1. `sudo ufw default deny incoming`
1. `sudo ufw allow ssh`
1. `sudo ufw enable`

### Install and configure Fail2ban
1. `sudo apt install fail2ban`
1. Verify service is running: `sudo systemctl status fail2ban`
