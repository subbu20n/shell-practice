#!/bin/bash 

USERID=$(id -u) 

R="\e[31m" 
G="\e[32m" 
Y="\e[33m" 
N="\e[0m" 

LOGS_FOLDER="/var/log/shellscripts-logs" 
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)" 
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

PACKAGES=("mysql" "nginx" "python3" "httpd") 
mkdir -p $LOGS_FOLDER 

echo -e "script started executed at: $(date)" | tee -a $LOG_FILE 
if [$USERID -ne 0 ] 
then 
  echo -e "$R ERROR:: please run this script with root access $N"  | tee -a $LOG_FILE 
  exit 1 
else 
  echo "you are running with root access" | tee -a $LOG_FILE 
fi 

#validate function takes input as exist status, what command that they tried to install 
validate(){
    if [ $1 - eq 0 ]
    then 
       echo -e "Installing $2 is... $G SUCCESS $N" | tee -a $LOG_FILE 
    else 
       echo -e "Installing $2 is... $R FAILURE $N" | tee -a $LOG_FILE 
    fi       
}

for package in ${PACKAGES[@]}

dnf list install $PACKAGE    &>> $LOG_FILE 
if [ $? -ne 0 ]
then  
  echo -e "$package is not installed ... going to install"  | tee -a $LOG_FILE 
  dnf install $package -y  &>> $LOG_FILE 
  VALIDATE $? "$PACKAGE" 
else 
  echo -e "Nothing to do $package... $Y already installed $N" | tee -a $LOG_FILE 
fi 

