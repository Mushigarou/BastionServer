# Born2beroot :

### OS
    - Install Debian or Rocky Linux
    - Installing minimum of services (no graphical interface)
    #### Rocky
        - Don't have to set up KDump, if you installed Rocky
        - SELinux must be runing at startup, and you need to adapt its configuration to the project requirements
    
    #### Debian        
        - Apparmor for Debian must be runing at startup

### Partionning    
    - create at least 2 encrypted partitions using LVM. (image p.5)
    - differences between aptitude and apt, or what SELinux or AppArmor

### SSH 
    - SSH service will be runing on port 4242
    - Connection with root via ssh should not be possible
    - Configure your operating system with the UFW (or firewalld for Rocky)
    - Your firewall must be active when you launch your virtual machine.
    - leave only port 4242 open.

### Hostname
    - The hostname must be the logging ending with 42
    - You will have to modify this hostname during your evaluation.

### Users

    - a user with your login as username has to be present.
    - This user has to belong to the user42 and sudo groups
    - During the defense, you will have to create a new user and assign it to a group.

### Sudo
        - Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password.
        - A custom message of your choice has to be displayed if an error due to a wrong password occurs when using sudo
        - Each action using sudo has to be archived, both inputs and outputs. The log file has to be saved in the /var/log/sudo/ folder.
        - The TTY mode has to be enabled
        - The paths that can be used by sudo must be restricted.
            /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin

### Strong password policy.
        
        - Your password has to expire every 30 days.
        - The minimum number of days allowed before the modification of a password will be set to 2.
        - The user has to receive a warning message 7 days before their password expires.
        - Your password must be at least 10 characters long. It must contain an uppercase
            letter, a lowercase letter, and a number. Also, it must not contain more than 3
            consecutive identical characters.
        - The password must not include the name of the user.
        - The following rule does not apply to the root password: The password must have
            at least 7 characters that are not part of the former password.
        - Of course, your root password has to comply with this policy.
        - you will have to change all the passwords of the accounts present on the virtual machine,
             including the root account.


### Script monitoring.sh
        - Must be developed in bash
        - At server startup, the script will display some information (listed below) on all ter-
            minals every 10 minutes (take a look at wall). The banner is optional. No error must
            be visible.

            -The architecture of your operating system and its kernel version.
                # uname -mrs
            •The number of physical processors, The number of virtual processors.
                # lscpu
            •The current available RAM on your server and its utilization rate as a percentage.
                # free -m
            •The current available memory on your server and its utilization rate as a percentage.
                # df -h
            •The current utilization rate of your processors as a percentage.
                # top
            •The date and time of the last reboot.
                # last -x | grep reboot
            •Whether LVM is active or not.
                # vgdisplay
            •The number of active connections.
                # netstat -n
            •The number of users using the server.
                # who
            •The IPv4 address of your server and its MAC (Media Access Control) address.
                # ip addr
            •The number of commands executed with the sudo program.
                grep -c 'sudo' /var/log/sudo.log
        - During the defense, you will be asked to explain how this script
            works. You will also have to interrupt it without modifying it.
            Take a look at cron.

        - image (p.8, p.9)

## BONUS

### Partionning
    - Set up partitions correctly so you get a structure (image p.10)
    - Set up a functional WordPress
        - lighttpd
        - MariaDB
        - PHP
    - Set up a service of your choice (justify your choice)
        - NGINX / Apache2 excluded!
        - To complete bonus part, you may open more ports to suit your needs. Of course, the UFW/Firewalld rules has to be adapted accordingly.

### You only have to turn in a signature.txt file at the root of your Git repository.
