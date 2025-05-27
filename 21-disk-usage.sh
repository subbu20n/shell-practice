#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1
MSG=""
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read line
do 
  USAGE=$(echo $line | awk '{print $6f}' |cut -d "%" -f1)
  PARTITION=$(echo $line | awk '{print $7f}')

  if [ $USAGE -ge $DISK_THRESHOLD ]
  then  
      MSG+="Hard Disk Usage on $PARTITION: $USAGE \n"
  fi    
done <<< $DISK_USAGE       

echo $MSG