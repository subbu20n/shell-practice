#!/bin/bash
R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/logs/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGS_FOLDER="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
 echo "Script started execution at : $(date) &>>$LOG_FILE


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo -e "$R ERROR:: please run this script with root access $N" &>>$LOG_FILE
   exit 1 # give other than 0 upto 127
else 
   echo "you are running with root access" &>>$LOG_FILE
fi

# validate function takes input as exit status what command they tried to install
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
       echo -e "Installing $2 ... $G SUCCESS $N" &>>$LOG_FILE
    else
       echo -e "Installing $2 ... $R FAILURE $N" &>>$LOG_FILE

       exit 1
    fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then 
   echo "mysql is not installed ... going to install" &>>$LOG_FILE
   dnf install mysql -y &>>$LOG_FILE
   VALIDATE $? "mysql"
else
   echo -e "nothing to do python3 ... $Y already installed $N" &>>$LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then 
   echo "nginx is not installed ... going to install" &>>$LOG_FILE
   dnf install nginx -y &>>$LOG_FILE
   VALIDATE $? "NGINX"
else
   echo -e "nothing to do nginx ... $Y already installed $N" &>>$LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then 
   echo "python3 is not installed ... going to install" &>>$LOG_FILE
   dnf install python3 -y &>>$LOG_FILE
   VALIDATE $? "PYTHON3"
else 
   echo -e "nothing to do python3 ... $Y already installed $N" &>>$LOG_FILE
fi





