#!/bin/bash

arch=300
arc=$(uname -a)
echo "HELLOOOOOOOOOOOOOO"
echo arch : $arc

if [ ! $arch -eq  200 ]
then
    echo "condition is true"
fi
