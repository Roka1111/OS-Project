#!/bin/bash


echo "===== SYSTEM REPORT =====" > report.txt
echo "Date: $(date)"  >> report.txt
echo "Hostname: $(hostname)" >> report.txt
echo "User: $(whoami)" >> report.txt

echo "----- CPU -----" >> report.txt
top -b -n1 | head -5 >> report.txt
echo "----- RAM -----" >> report.txt
free -h  >> report.txt

echo "----- DISK -----"  >> report.txt
df -h  >> report.txt

echo "----- LAST LOGINS -----" >> report.txt
last -n 3 >> report.txt


echo "Enter the username :"
read user
echo "Enter the IP :"
read ip
echo "sending report ..."
scp report.txt $user@$ip:~/reports/ 2>/dev/null  #the recipient should have this directory
echo "Done"




