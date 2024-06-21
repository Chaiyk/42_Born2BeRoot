#!/bin/bash
UNAME=`uname -a`
PCPU=`lscpu | grep '^Socket' | grep -o '[[:digit:]]'`
VCPU=`lscpu | grep '^Core' | grep -o [[:digit:]]`
RAMU=`free -m | awk 'NR==2 {printf "%s/%sMB(%.2f%%)\n", $3, $2, $3/$2*100}'`
DSKU=`df -h | awk '$NF=="/" {printf "%s/%s (%s)\n", $3, $2, $5}'`

wall "
#Architecture: $UNAME
#CPU Physical: $PCPU
#vCPU: $VCPU
#Memory Usage: $RAMU
#Disk Usage: $DSKU
"
