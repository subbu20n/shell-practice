#!/bin/bash 

# SOURCE_DIR="/home/ec2-user/app-logs" 
# FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

# while IFS= read -r filepath 
# do 
#   rm -rf $filepath 
# done <<< $FILES_TO_DELETE   

START_TIME=$(date +%s) 
USERID=$(id -u) 

R="\e[31m" 
G="\e[32m"
Y="\e[33m" 
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs" 
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) 
LOG_FILE="$LOG_FOLDERS/$SCRIPT_NAME.log" 

SOURCE_DIR="/home/ec2-user/app-logs" 

mkdir -p $LOGS_FOLDER 
echo -e "scritp started execution at: $(date)" | tee -a $LOG_FILE 

if [ $USERID -ne 0 ] 
then 
   echo -e "$R ERROR:: please run this script with root access $N" | tee -a $LOG_FILE 
   exit 1
else 
   echo -e "you are running with root access" | tee -a $LOG_FILE 
fi 

#validate function takes input as exit status, what command they tried to install 
validate(){
    if [ $? -eq 0 ]  
    then 
      echo -e "Installing $2 is ... $G SUCCESS $Y" | tee -a $LOG_FILE 
    else 
      echo -e "Installing $2 is ... $Y FAILURE $Y" | tee -a $LOG_FILE 
    fi     
}

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14) 

while IFS= read -r filepath 
do 
  echo -e "Deleting file: $filepath" | tee -a $LOG_FILE 

  rm -rf $filepath 
done <<< $FILES_TO_DELETE 

echo -e "script executed successfully" | tee -a $LOG_FILE 

END_TIME=$(date +%s) 
TOTAL_TIME=$(($END_TIME - $START_TIME)) 

echo -e "script execution completed successfully, $Y time taken: $TOTAL_TIME seconds $N" | tee -a $LOG_FILE  