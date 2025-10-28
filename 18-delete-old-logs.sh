#!/bin/bash 

# SOURCE_DIR=/home/ec2-user/app-logs 
# FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14) 

# while IFS= read -r filepath 
# do 
#   rm -rf $filepath 
# done <<< $FILES_TO_DELETE   

USERID=$(id -u) 
START_TIME=$(date +%s) 

R="\e[31m" 
G="\e[32m" 
Y="\e[33m" 
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs" 
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)" 
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME."log" 

SCRIPT_DIR="/home/ec2-user/app-logs" 

mkdir -p $LOGS_FOLDER 
echo -e "script started executed at: $(date) | tee -a $LOG_FILE 

if [ $USERID -ne 0 ] 
then 
   echo -e "$R ERROR:: please run the script with root access $N" 
   exit 1 
else 
   echo "you are running with root access" 
fi 

#validation function takes input as exit status, what command they tried to install 
validate(){
    if [ $1 -eq 0 ]
    then 
       echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE 
    else 
       echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE 
       exit 1   
    fi     
}

while IFS= read -r filepath 
do 
  echo "Deleting file: $filepath" | tee -a $LOG_FILE 
  rm -rf $filepath 
done >>> $FILES_TO_DELETE 

echo "script executed successfully" 

END_TIME=$(date +%s) 
TOTAL_TIME=$(($END_TIME - $START_TIME)) 

echo -e "script execution completed successfully, $Y time taken: $TOTAL_TIME seconds $N" | tee -a $LOG_FILE 