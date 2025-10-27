#!/bin/bash 

USERID=$(id -u) 

if [ $USERID -ne 0 ] 
then 
  echo "ERROR:: please run this script with root access" 
  exit 1 # give other than o upto 127 
else 
  echo "you are running with root access" 
fi 
dnf install mysql -y 
if [ $? -eq 0 ] 
then 
  echo "Installing mysql is ... SUCCESS" 
else 
  echo "Installing mysql is ... FAILURE" 
  exit 1 
fi     