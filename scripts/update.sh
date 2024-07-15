#!/bin/bash

os_release=/etc/os-release

if grep -q "Arch" $os_release
then
    sudo pacman -Syu
fi

if grep -q "Ubuntu" $os_release || grep -q "Debian" $os_release
then
    sudo apt update -y && sudo apt dist-upgrade -y
fi