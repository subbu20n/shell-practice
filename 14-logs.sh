#!/bin/bash
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/Var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
echo "script start executing at: $(date) &>>$LOG_FILE 

if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR:: please run this script with root access $N" &>>$LOG_FILE 
    exit 1 # give other than 0 upto 127
else 
    echo "you are running root access" &>>$LOG_FILE 
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then 
      echo -e "installing $2 is... $G SUCCESS $N" &>>$LOG_FILE 
    else
       echo -e "installing $2 is... $R FAILURE $N" &>>$LOG_FILE 
fi         
}

dnf list installed mysql &>>$LOG_FILE 
    if [ $? -ne 0 ]
    then
      echo "mysql is not installed...going to installed" &>>$LOG_FILE 
      dnf install mysql -y &>>$LOG_FILE 
      VALIDATE $? "MYSQL"
    else 
       echo -e "Nothing to do mysql ... $Y already installed $N" &>>$LOG_FILE 
 fi

 dnf list installed python3 &>>$LOG_FILE 
    if [ $? -ne 0 ]
    then 
       echo "python3 is not installed...going to installed" &>>$LOG_FILE 
       dnf install python3 -y &>>$LOG_FILE 
       VALIDATE $? "PYTHON3"
    else 
       echo -e "Nothing to do python3 ... $Y already installed $N" &>>$LOG_FILE 
fi

dnf list installed nginx &>>$LOG_FILE 
    if [ $? -ne 0 ]
    then  
       echo "nginx is not installed...going to install" &>>$LOG_FILE 
       dnf install nginx -y &>>$LOG_FILE 
       VALIDATE $? "NGINX"
    else
       echo -e "Nothing to do nginx ... $Y already installed $N" &>>$LOG_FILE 
fi            