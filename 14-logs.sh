#!/bin/bash 

USERID=$(id -u) 

R="\e[31m"
G="\e[32m" 
Y="\e[33m" 
N="\e[33m" 

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) 
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log" 

mkdir -p $LOGS_FOLDER 
echo "script started executed at: $(date)" | tee -a $LOG_FILE 

if [ $USERID -ne 0 ] 
then 
   echo -e "$R ERROR:: please run this script with root access $N" | tee -a $LOG_FILE 
   exit1 
else 
   echo -e "you are running with root access" | tee -a $LOG_FILE 
fi 

# validate function takes input as exit status what command they tried to install it 
validate() {
  if [ $? -eq 0 ] 
  then 
     echo -e "Installing $2 is ... $G SUCCESS $N"  | tee -a $LOG_FILE 
  else 
     echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE 
     exit1 
  fi    
}

dnf list installed nginx  &>> $LOG_FILE  
if [ $? -ne 0 ] 
then 
   echo -e "nginx is not installed ... going to install" | tee -a $LOG_FILE 
   dnf install nginx -y &>> $LOG_FILE  
   VALIDATE $? "NGINX" &>> $LOG_FILE  
else 
  echo -e "Nothing to do nginx ... $Y already installed $N"  | tee -a $LOG_FILE 
fi 

dnf list installed python3 &>> $LOG_FILE  
if [ $? -ne 0 ] 
then 
   echo -e "python3 is not installed ... going to install" | tee -a $LOG_FILE 
   dnf install python3 -y &>> $LOG_FILE  
   VALIDATE $? "python3" &>> $LOG_FILE  
else 
  echo -e "Nothing to do python3 ... $Y already installed $N"  | tee -a $LOG_FILE 
fi 

dnf list installed mysql &>> $LOG_FILE  
if [ $? -ne 0 ] 
then 
   echo -e "mysql is not installed ... going to install"  | tee -a $LOG_FILE 
   dnf install mysql -y &>> $LOG_FILE  
   VALIDATE $? "mysql" &>> $LOG_FILE  
else 
  echo -e "Nothing to do mysql ... $Y already installed $N" | tee -a $LOG_FILE 
fi 

