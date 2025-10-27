#!/bin/bash 

USERID=$(id -u) 
 
if [ $USERID -ne 0 ] 
then 
  echo "ERROR:: please run this script with root access" 
  exit 1 
else 
  echo "you are running with root access" 
fi

if [ $? -ne 0 ] 
then 
   echo "MYSQL is not installed ... going to install" 
   dnf install mysql -y 
   if [ $? -eq 0 ] 
   then 
      echo "Installing MYSQL is ... SUCCESS" 
   else 
      echo "Installing MYSQL is ... FAILURE" 
   fi 
else 
  echo "MYSQL is already installed ... nothing to do" 
fi 
              