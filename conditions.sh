#!/bin/bash
USERID=$(id -u) 

if [ $USERID -ne 0 ]
then
    echo "ERROR :: please run this script with root access"
    exit 1
else 
    echo "run this script with root access"
fi        
dnf install mysql

if [ $? -eq 0 ]
then
    echo "Installing mysql is .. success"
else 
    echo "installing mysql is .. failure"
    exit 1
fi        