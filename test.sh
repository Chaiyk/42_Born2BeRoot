#!/bin/bash
UNAME=`uname -a`
PCPU=`lscpu | grep -E '^Socket' | grep -o '[[:digit:]]'`
VCPU=`lscpu | grep -E '^Core' | grep -o [[:digit:]]`

wall "
#Architecture: $UNAME
#CPU Physical: $PCPU
#vCPU: $VCPU
"
