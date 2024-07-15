# BastionServer

A minimal Debian server, set up by hand in VirtualBox and hardened step by step:
no graphical interface, encrypted disks, a strict firewall, locked-down SSH and sudo,
a strong password policy, and a monitoring script that reports the server's health.

This repo holds my setup notes and the shell scripts I wrote along the way.

## What is configured

### Disk
- At least two **encrypted partitions with LVM**, so the disk layout can grow later
  without reinstalling.

### Security
- **AppArmor** enabled at boot.
- **UFW firewall** active at startup, with only the SSH port open.
- **SSH** on a non-default port, with **root login disabled**.

### Users and sudo
- A regular user in the `sudo` group; root is not used directly.
- sudo allows **3 password attempts**, then shows a custom error message.
- **Every sudo command is logged** (input and output) in `/var/log/sudo/`.
- **TTY mode** is required, and sudo's `PATH` is restricted to the system folders:
  `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin`

### Password policy
- Passwords expire every **30 days**, can be changed at most every **2 days**,
  and the user is warned **7 days** before.
- At least **10 characters**, with an uppercase letter, a lowercase letter and a number.
- No more than **3 identical characters** in a row, and the username is not allowed.
- A new password must differ from the old one by at least **7 characters**
  (the root password follows the same rules, except this last one).

### Monitoring
[`scripts/monitoring.sh`](scripts/monitoring.sh) runs from **cron every 10 minutes**
and broadcasts a report to all terminals with `wall`:

| Info | Command used |
|---|---|
| OS architecture and kernel | `uname -mrs` |
| Physical and virtual CPUs | `lscpu` |
| RAM used / available (%) | `free -m` |
| Disk used / available (%) | `df -h` |
| CPU load (%) | `top` |
| Last reboot | `last -x \| grep reboot` |
| LVM active or not | `lsblk` |
| Active TCP connections | `netstat -n` |
| Logged-in users | `who` |
| IPv4 and MAC address | `ip addr` |
| Number of sudo commands | sudo log |

### Extra: web server
- A working **WordPress** site on **lighttpd**, **MariaDB** and **PHP**,
  with the firewall rules opened only for the ports it needs.

## Notes

My notes on each topic are in the `.txt` files at the root of this repo:
AppArmor, firewall, SSH, sudo, TTY, password policy, user management,
package managers, storage, processes and daemons, networking and scripting.
