#!/bin/bash 
START_TIME=$(date +%s)
USERID=$(id -u)
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE=$LOGS_FOLDER/backup.log 

mkdir -p /app 
echo "script started execution at: $(date)" | tee -a $LOG_FILE 

if [ $USERID -ne 0 ]
then 
   echo -e "$R ERROR:: please run this script with root acces $N" | tee -a $LOG_FILE 
   exit 1 
else 
   echo " yor are running with root access" | tee -a $LOG_FILE 
fi 

# validate function takes input as exit status what command tried to install 
VALIDATE(){
   if [ $1 -eq 0 ]
   then 
      echo -e "installing $2 is... $G SUCCESS $N" | tee -a $LOG_FILE 
   else 
      echo -e "installing $2 is... $R FAILURE $N" | tee -a $LOG_FILE 
   fi       
}

USAGE(){
   echo "$R USAGE:: $N sh 20-backup.sh <source-directory> <destination-directory> <optional(days)>"
   exit 1
}

if [ $# -lt 2 ]
then 
    USAGE
fi 

if [ ! -d $SOURCE_DIR ]
then 
   echo -e "source directory $SOURCE_DIR does not exist please check $N" | tee -a $LOG_FILE 
   exit 1
fi 

if [ ! -d $DEST_DIR ]
then 
   echo -e "destination directory $DEST_DIR does not exist please check $N" | tee -a $LOG_FILE 
   exit 1 
fi 

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
if [ ! -z $FILES ]
then 
   echo "files to zip are: $FILES"
else 
   echo -e "no log files found older than 14days ... $Y SKIPPING $N" | tee -a $LOG_FILE 
fi       