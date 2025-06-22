#!/bin/bash 
START_TIME=$(date +%s)
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR="/home/ec2-user/app-logs"

mkdir -p /app 
echo "script execution started at: $(date)" | tee -a $LOG_FILE 

if [ $USERID -ne 0 ]
then 
   echo -e "$R ERROR:: please run this script with root access $N" | tee -a $LOG_FILE 
   exit 1 
else 
   echo "you are running with root access" | tee -a $LOG_FILE 
fi 

# validate function takes input as exit status what command they tried to install 
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
       echo -e "installing $2 is... $G SUCCESS $N" | tee -a $LOG_FILE 
    else 
       echo -e "instaling  $2 is... $R FAILURE $N" | tee -a $LOG_FILE 
       exit 1 
    fi       
}

FILES_TO_DELETE=$(find -name "*.log" -mtime +14)
while IFS= read -r filepath 
do 
   echo "deleting file: $filepath"
   rm -rf $filepath 
done >>>$FILES_TO_DELETE

END_TIME=$(date +%s)
TOTAL_TIME=$(( $END_TIME - $START_TIME ))

echo -e "script execution completed successfully, $Y timetaken: $TOTAL_TIME seconds $N" | tee -a $LOG_FILE 
       