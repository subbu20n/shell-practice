#!/bin/bash
USERID=$(id -u) 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo "$R ERROR :: please run this script with root access $N"
    exit 1
else 
    echo "run this script with root access"
fi        
VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo "Installing $2 is ..  $G success $N"
else 
    echo "installing $2 is .. $R failure  $N"
    exit 1
fi        
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "mysql is not installed ... going to install"
    dnf install mysql -y
    validate $? "MYSQL"
else 
    echo "nothing to do mysql ... $Y already installed $N"
fi    

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo "nginx is not installed ... going to install"
    dnf install mysql -y
    validate $? "nginx"
else 
    echo "nothing to do nginx ... $Y already $N"
fi    

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo "python3 is not installed ... going to install"
    dnf install mysql -y
    validate $? "python3"
else 
    echo "nothing to do python3 ... $Y already installed $N"
fi    

