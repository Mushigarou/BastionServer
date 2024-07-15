#!/bin/bash

ifconfig=/sbin/ifconfig

if [ -f $ifconfig ]
then
    echo "Command found"
else
    echo "command not found"
    apt update && apt install -y net-tools
fi

$ifconfig