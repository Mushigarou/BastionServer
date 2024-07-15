#!/bin/bash

check_lvm(){
        if lsblk | awk '{print $6}'| grep "lvm" &> /dev/null
        then
                lvm=yes
        else
                lvm=no
        fi
}

arch=$(uname -a)

cpu=$(nproc --all)

# if number of vcpu > cpu. the CPU is using hyper-threading technology
vcpu=$(cat /proc/cpuinfo | grep "processor" | wc -l)

memory_mega=$(df -h --total --block-size=1M | awk 'END {print $3}')

memory=$(df -h --total  | awk 'END {printf("/%sb (%s)\n", $2, $5)}')

ram=$(free --mega | grep Mem | awk '{printf("%s/%sMB (%.2f%%)\n", $3, $4, ($3/$4)*100)}')

cpu_load=$(top -n1 | grep -w "%Cpu(s):" | awk '{printf("%.1f%%", $2+$4+$5)}')

reboot_date=$(last -x --time-format iso | grep reboot | awk 'NR == 1 {print $5}' | awk -F 'T' '{print $1}')

reboot_time=$(last -x --time-format short | grep reboot | awk 'NR == 1 {print $8}')

inet=$(/usr/sbin/ifconfig | grep -w inet | grep -w broadcast | awk 'NR==1 {print $2}')

mac=$(/usr/sbin/ifconfig | grep -w ether | awk 'NR==1 {print $2}')

connections_estab=$(ss -t | grep -w "ESTAB" | wc -l)

users_log=$(who | wc -l)

sudo_command=$(cat /var/log/sudo/sudo.log | grep -w "TSID" | wc -l)

check_lvm

echo "#Architecture: $arch"
echo "#CPU physical: $cpu"
echo "#vCPU: $vcpu"
echo "#Memory Usage: $ram"
echo "#Disk Usage: $memory_mega$memory"
echo "#CPU load: $cpu_load"
echo "#Last boot: $reboot_date $reboot_time"
echo "#LVM use: `echo $lvm`"
echo "#Connections TCP : $connections_estab ESTABLISHED"
echo "#User log: $users_log"
echo "#Network: IP $inet ($mac)"
echo "#Sudo : $sudo_command"