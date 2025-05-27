#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 # in projects it will be 75%
MSG=""
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read -r line 
do 
  USAGE=$(echo $line | awk '{print $6f}'| cut -d "%" -f1)
  PARTITION=$(echo $line | awk '{print $7f}')
  if [ $USAGE -ge $DISK_THRESHOLD ]
  then
     MSG+="HIgh disk usage on $PARTITION: $USAGE  % <br>" #<br> represents html new
  fi   
  done <<< $DISK_USAGE

    #echo -e $MSG

    sh mail.sh "Devops Team" "Alert_type" "$IP" "$MSG" "subbunandyala68@gmail.com" "Alert-Hard Disk Usage"