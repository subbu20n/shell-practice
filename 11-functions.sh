#!/bin/bash 

USERID=$(id -u) 

if [ $USERID -ne 0 ] 
then 
  echo "ERROR:: please run the script with root access" 
  exit 1 
else 
  echo "you are running with root access" 
fi 

#validate function takes input as exit status , what command they tried to install 
validate(){
    if [ $1 -eq 0 ]
    then 
       echo "Installing $2 is ... SUCCESS" 
    else 
       echo "Installing $2 is ... FAILURE" 
       exit1 
    fi       
}

dnf list installed mysql 
if [ $? -ne 0 ] 
then 
  echo "Mysql is not installed ... going to install" 
  dnf install mysql -y 
  validate $? "MYSQL" 
else 
  echo "Mysql is already installed ... nothing to do" 
fi 

dnf list installed python3 
if [ $? -ne 0 ] 
then 
  echo "python3 is not installed ... going to install" 
  dnf install python3 -y 
  validate $? "PYTHON3" 
else 
  echo "Python3 is already installed ... nothing to do" 
fi 

dnf list installed ngins 
if [ $? -ne 0 ] 
then 
  echo "nginx is not installed ... going to install" 
  dnf install nginx -y 
  validate $? "NGINX" 
else 
  echo "nginx is already installed ... nothing to do" 
fi     