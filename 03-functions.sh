#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR:: please run this script with root user"
     exit 1 # give other than 0 upto 127
else
    echo "you are running with root user"
fi     

#validae function takes input as exit status what command they tried to install
VALIDATE(){
if [ $1 -eq 0 ]
then 
    echo "installing $2 is... SUCCESS"
else
     echo "installing $2 is... FAILURE"
     exit 1
fi         
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
  echo "mysql is not installed...going to install"
  dnf install mysql -y
  VALIDATE $? "mysql"
else 
    echo "mysql is already installed...nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo "python3 is not installed...going to installed"
    dnf install python3
    VALIDATE $? "PYTHON3"
else
    echo "python3 is already installed...nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo "nginx is not installed...going to installed"
    dnf installed nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed...nothing to do"
fi        