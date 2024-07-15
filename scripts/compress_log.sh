#!/bin/bash

for file in /var/log/*.log
do
    tar -czvf $file.tar.gz $file
done
