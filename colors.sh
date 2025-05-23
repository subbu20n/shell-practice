#!/bin/bash
R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo -e "$R ERROR:: please run this script with root access $N"
   exit 1 # give other than 0 upto 127
else 
   echo "you are running with root access"
fi

# validate function takes input as exit status what command they tried to install
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
       echo -e "Installing $2 ... $G SUCCESS $N"
    else
       echo -e "Installing $2 ... $R FAILURE $N"

       exit 1
    fi
}

dnf list installed mysql 
if [ $? -ne 0 ]
then 
   echo "mysql is not installed ... going to install"
   dnf install mysql -y
   VALIDATE $? "mysql"
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

dnf list installed python3
if [ $? -ne 0 ]
then 
   echo "python3 is not installed ... going to install"
   dnf install python3 -y
   VALIDATE $? "PYTHON3"
else 
   echo -e "nothing to do python3 ... $Y already installed $N"
fi





