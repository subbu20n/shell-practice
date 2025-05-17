#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
  echo "error:: please run this script with root access"
  exit1
else
   echo "you are running with root access"
fi

VALIDATE[]{
if [ $1 -eq 0 ]
    echo "installing $2 is. SUCCESS"
 else
    echo "installing $2 is ..Failure"
    exit1
    fi
}

 dnf list installed mysql

 if [ $? -ne 0 ]
 then 
   echo "mysql is not installed .. going to install"
   dnf install mysql -y
   VALIDATE $? "mysql"
else 
   echo "mysql already installed. nothing to do "
fi

dnf list installed nginx

 if [ $? -ne 0 ]
 then 
   echo "nginx not installed ... going to install"
   dnf install nginx
   VALIDATE $? "nginx"
else 
   echo "nginx is already installed ... nothing to do "
fi
   
dnf list installed python3

 if [ $? -ne 0 ]
 then 
   echo "python3 is not installed .. going to install"
   dnf install python3
   VALIDATE $? "python3"
else 
   echo "python3 is already installed ...nothong to do"
fi
