#!/bin/bash

echo "Operating System Information:"
uname -a

echo

echo "Installed Packages:"
dpkg -l

echo

echo "Network Information:"
ifconfig -a
ip addr

echo

echo "Running Processes:"
ps aux

echo

echo "Open Ports:"
netstat -tuln

echo

echo "Scheduled Tasks:"
crontab -l

echo

echo "Users:"
cat /etc/passwd

echo

echo "Groups:"
cat /etc/group

echo

echo "Check sudo su availability:"
if sudo -n su -c "echo Success" >/dev/null 2>&1; then
    echo "sudo su is allowed"
else
    echo "sudo su is not allowed"
fi

echo

echo "Files in tmp"
ls -al /tmp

