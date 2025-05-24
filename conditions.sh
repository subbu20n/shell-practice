#!/bin/bash
USERID=$(id -u) 

if [ $USERID -ne 0 ]
then
    echo "ERROR :: please run this script with root access"
    exit 1
else 
    echo "run this script with root access"
fi        

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "mysql is not installed ... going to install"
dnf install mysql

if [ $? -eq 0 ]
then
    echo "Installing mysql is .. success"
else 
    echo "installing mysql is .. failure"
    exit 1
fi        

else 
    echo "mysql is already installed ... nothing to do"
fi    

