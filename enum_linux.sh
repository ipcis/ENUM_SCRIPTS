#!/bin/bash

echo "Operating System Information:"
uname -a

echo

echo "Installed Packages:"
dpkg -l

echo

echo "Network Information:"
ifconfig -a

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

