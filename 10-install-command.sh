#!/bin/bash 

USERID=$(id -u) 

if [ $USERID -ne 0 ] 
then 
   echo "ERROR:: please run this script with root access" 
   exit 1 
else 
  echo "you are running with root access" 
fi 

dnf list installed nginx 

if [ $? -ne 0 ] 
then 
   echo "nginx is not installed ... going to installed" 
   dnf install nginx -y 
   if [ $? -eq 0 ] 
   then 
      echo "Installing nginx is .. success"
   else 
      echo "Installing nginx is .. failure" 
      exit1 
   fi 
else 
   echo "nginx is already installed ... nothing to do" 
fi             