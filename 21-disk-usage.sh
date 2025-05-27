#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 # in projects it will be 75%
MSG=""

while IFS= read -r line 
do 
  USAGE=$(echo $line | awk '{print $6f}'| cut -d "." -f1)
  PARTITION=$(echo $line | awk '{print $7f}')

  if [ $USAGE -gt $DISK_THRESHOLD ]
  then
     MSG+="HIgh disk usage on $PARTITION: $USAGE"
  fi   
  done <<< $DISK_USAGE

    echo $MSG