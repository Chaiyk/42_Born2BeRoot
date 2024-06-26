#!/bin/bash
UNAME=`uname -a`
PCPU=`lscpu | grep '^Socket' | grep -o '[[:digit:]]'`
VCPU=`lscpu | grep '^Core' | grep -o [[:digit:]]`
RAMU=`free -m | awk 'NR==2 {printf "%s/%sMB(%.2f%%)\n", $3, $2, $3/$2*100}'`
DSKU=`df -h | awk '$NF=="/" {printf "%s/%s (%s)\n", $3, $2, $5}'`
CPUL=`top -bn1 | grep '%Cpu' | awk '{printf"%.1f%%", $2 + $4}'`
LAST=`who -b | awk '{printf"%s %s", $3, $4}'`
LVMV=`lsblk | grep "lvm" | wc -l`
LVMU=`if [ $LVMV -eq 0 ]; then echo no; else echo yes; fi`
CTCP=`ss -Ht state established | wc -l`
ULOG=`users | wc -w`
IPV4=`hostname -I`
MACA=`ip a | grep ether | awk '{printf"%s", $2}'`
#COMD=`cat /var/log/sudo/sudo.log | grep "COMMAND" | wc -l`
COMD=`journalctl _COMM=sudo | grep COMMAND | wc -l`

wall "
#Architecture: $UNAME
#CPU Physical: $PCPU
#vCPU: $VCPU
#Memory Usage: $RAMU
#Disk Usage: $DSKU
#CPU Load: $CPUL
#Last Boot: $LAST
#LVM use: $LVMU
#Connections TCP: $CTCP ESTABLISHED
#User log: $ULOG
#Network: IP $IPV4($MACA) 
#Sudo: $COMD
"
