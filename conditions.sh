#!/bin/bash
USERID=$(id -u) 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo  $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started at: $(date)" |  tee -a $LOG_FILE
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR :: please run this script with root access $N" || tee -a$LOG_FILE
    exit 1
else 
    echo "run this script with root access" | tee -a $LOG_FILE
fi        
VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo -e "Installing $2 is ..  $G success $N" | tee -a $LOG_FILE
else 
    echo  -e "installing $2 is .. $R failure  $N" | tee -a $LOG_FILE
    exit 1
fi        
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo "mysql is not installed ... going to install" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    validate $? "MYSQL"
else 
    echo -e "nothing to do mysql ... $Y already installed $N" | tee -a $LOG_FILE
fi    

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo "nginx is not installed ... going to install" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    validate $? "nginx"
else 
    echo -e "nothing to do nginx ... $Y already $N" | tee -a $LOG_FILE
fi    

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo "python3 is not installed ... going to install" | tee -a$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    validate $? "python3"
else 
    echo -e "nothing to do python3 ... $Y already installed $N" | tee -a $LOG_FILE
fi    