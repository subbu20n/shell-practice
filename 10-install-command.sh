#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "ERROR:: please run this script with root access"
   exit 1 # give other than 0 upto 127
else
    echo "you are running with root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "mysql is not installed...going to installed"

dnf install mysql -y

if [ $? -eq 0 ]
then
   echo " installing mysql is... SUCCESS"
else 
   echo "installing mysql is... FAILURE"
   exit 1
fi      
else 
    echo "mysql is already installed...nothing to do"
fi    