#!/bin/bash 

USERID=$(id -u) 

if [ $USERID -ne 0 ] 
then 
  echo "ERROR:: please run this script with root access" 
  exit 1 
else 
  echo "you are running with root access" 
fi 

#validate fumction takes input as exit status , what command they tried to do install 
if [ $1 -eq 0 ] 
then 
  echo "Installing $2 is ... SUCCESS" 
else  
  echo "Installing $2 is ... FAILURE" 
  exit 1 
fi 

dnf list install mysql 
if [ $? -ne 0 ] 
then 
  echo "Mysql is not installed ... going to install" 
  dnf install mysql -y 
  VALIDATE $? "MYSQL" 
else 
  echo "Mysql is already installed ... nothing to do" 
fi 

dnf list installed python3 
if [ $? -ne 0 ] 
then
  echo "Python3 is not installed ... going to install" 
  dnf install python3 -y 
  VALIDATE $? "PYTHON3" 
else 
  echo "python3 is already installed ... nothing to do" 
fi 

dnf list installed nginx 
if [ $? -ne 0 ] 
then 
  echo "Nginx is not installed ... going to install" 
  dnf install nginx -y 
  VALIDATE $? "NGINX" 
else 
  echo "Nginx is already installed ... nothing to do"   