#!/bin/bash 

USERID=$(id -u) 

R="\e[31m" 
G="\e[32m" 
Y="\e[33m" 
N="\e[0m" 

if [ $USERID -ne 0 ] 
then 
   echo -e "$R ERROR:: please run this script with root access $N" 
   exit 1 
else 
   echo "you are running with root access" 
fi 

#validate function takes input as exit status , what command they tried to install 
validate(){
    if [ $1 -eq  0 ] 
    then 
       echo -e "Installing $2 is ... $G SUCCESS $N" 
    else 
       echo -e "Insatlling $2 is ... $R FAILURE $N" 
       exit 1 
    fi       
}

dnf list installed mysql 
if [ $? -ne 0 ] 
then 
   echo -e "mysql is not installed ... going to install it" 
   dnf install mysql -y 
   validate $? "MYSQL" 
else 
   echo -e "mysql is already installed ... $Y nothing to do $N" 
fi 

dnf list installed python3 
if [ $? -ne 0 ] 
then 
   echo -e "python3 is not installed ... going to install it" 
   dnf install python3 -y 
   validate $? "PYTHON3" 
else 
   echo -e "python3 is already installed ... $Y nothing to do" 
fi 

dnf list installed nginx 
if [ $? -ne 0 ] 
then 
   echo -e "nginx is not installed ... going to install it" 
   dnf install nginx -y 
   validate $? "NGINX" 
else 
   echo -e "nginx is already installed ... $Y nothing to do $N" 
fi 
