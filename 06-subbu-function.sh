#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run this script with root access"
    exit 1 # give other number upto 0 to 127
else
    echo "you are running with root user"
fi

#validate function takes  input as exit status when they tried to install it

VALIDATE(){
if [ $1 -eq 0 ]
then 
    echo "installing $2 is...SUCCESS"
else
    echo "installing $2 is...FAILURE"
    exit 1
fi    
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
   echo "mysql is not installed...going to install"
   dnf install mysql -y
   VALIDATE $? "MYSQL"
else
    echo "mysql is already installed...nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
   echo "python3 is not installed...going to install"
   dnf install python3
   VALIDATE $? "PYTHON3"
else
   echo "python3 is already installed...nothing to do"
fi

dnf list installed nginx 
if [ $? -ne 0 ]
then 
    echo "nginx is not installed...going to install"
    dnf install nginx -y
    VALIDATE $? "NGINX"
else 
   echo "nginx is already installed...nothing to do"

fi     