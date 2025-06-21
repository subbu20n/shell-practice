#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo -e "ERROR:: $R please run this script with root access $N"
   exit 1
else 
   echo "you are running with root acces"
fi 

# validate function takes input as exit status what command they tried to install 
VALIDATE(){
    if [ $1 -eq 0 ]
    then
       echo -e "Installing $2 is ... $G SUCCESS $N"
    else
       echo -e "Installing $2 is ... $R FAILURE $N"
       exit1   
    fi   
}

dnf list installed mysql 
if [ $? -ne 0 ]
then 
    echo " mysql is not installed ... going to install"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else 
    echo -e "nothing to do mysql ... $Y already installed $N"
fi 

dnf list installed python3
if [ $? -ne 0 ]
then 
   echo "python3 is not installed ... going to installed"
   dnf installed python3 
   VALIDATE $? "PYTHON3"
else 
    echo -e "nothing to do python3 ... $Y already installed $N"
fi 

dnf list installed nginx
if [ $? -ne 0 ]
then
   echo "nginx is not installed ... going to install"
   dnf install nginx -y 
   VALIDATE $? "NGINX"
else 
   echo -e "nothing to do nginx ... $Y already installed $N"
fi       