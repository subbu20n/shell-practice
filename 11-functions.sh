#!/bin/bash 

USERID=$(id -u) 

if [ $USERID -ne 0 ] 
then 
  echo "ERROR:: Please run this script with root access'" 
  exit 1 
else 
  echo "you are running with root access" 
fi 

# validation function takes input as exit status what command they tried to install 
validate(){
  if [ $? -eq 0 ] 
then 
   echo "Installing $2 is ... success" 
else 
   echo "Installing $2 is ... failure" 
   exit 1 
fi 

}

dnf list installed mysql 
if [ $? -ne 0 ]
then 
   echo "mysql is not installed ... going to install" 
   dnf install mysql -y 
   VALIDATE $? "MYSQL" 
else 
  echo "mysql is already installed ... nothing to do" 
fi 

dnf list installed nginx 
if [ $? -ne 0 ] 
then 
   echo "nginx is ot installed ... going to install" 
   dnf install nginx -y 
   VALIDATE $? "NGINX" 
else
   echo "nginx is already installed ... nothing to do" 
fi 

dnf list installed python3 
if [ $? -ne 0 ]
then 
   echo " python3 is not installed ...going to install" 
   dnf install python3 -y 
   VALIDATE $? "PYTHON3" 
else 
   echo "python3 is already installed ... nothing to do" 
fi         
  