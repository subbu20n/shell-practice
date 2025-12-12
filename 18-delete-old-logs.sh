#!/bin/bash 

# SOURCE_DIR=/home/ec2-user/app-logs

# FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14) 
# while IFS= read -r filepath 
# do 
#   rm -rf $filepath 
# done <<<$FILES_TO_DELETE  

USERID=$(id -u) 
R="\e[31m" 
G="\e[32m"
Y="\e[33m" 
N="\e[0m" 

LOGS_FOLDER="/var/log/shellscript-logs" 
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) 
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 
SCRIPT_DIR="/home/ec2-user/app-logs" 

mkdir -p $LOGS_FOLDER 

#check the root user 
if [ $USERID -ne 0 ] 
then 
   echo -e "$R ERROR:: please runt htis script with root access $N" | tee -a $LOG_FILE
   exit 1 
else 
   echo -e "you are running with root access" | tee -a $LOG_FILE
fi 

# validation function takes input as exit status what command they tried to install 
validation (){
  if [ $1 -eq 0 ]
  then 
     echo -e "Installing $2 iss .. $G SUCCESS $N" | tee -a $LOG_FILE
  else 
     echo -e "Installing $2 is ... $R FAILURE $N"    | tee -a $LOG_FILE
}

echo -e "Script execution started at: $(date +%s)" | tee -a $LOG_FILE

FILES-TO_DELETE=$(find . -name "*.log" -mtime +14) | tee -a $LOG_FILE 

while IFS= read -r filepath 
do 
   echo -e "Files to delete: $filepath" | tee -a $LOG_FILE
   rm -rf $filepath      | tee -a $LOG_FILE
done <<<$FILES_TO_DELETE  

echo -e "script executed successfully" | tee -a $LOG_FILE



