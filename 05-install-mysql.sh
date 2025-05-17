#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run this script with root access"
    exit 1 # give other number 0 upto 127
else
    echo "you are running with root access" 
fi

dnf install mysql -y 

if [ $? -eq 0 ]
then 
  echo "installing mysql is...SUCCESS"
else
  echo "installing mysql is...FAILURE"
fi    
