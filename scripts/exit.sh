#! /bin/bash
deb=htop

echo $deb >> print.log

if [ $? -eq 0 ]
then
    echo "command was successfully" >> print.log
else
    echo "something went wrong" >> print.log
fi

echo "Hello"
exit 6
echo $?