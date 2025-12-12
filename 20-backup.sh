#!/bin/bash 

USERID=$(id -u) 
START_TIME=$(date +%s) 
SOURCE_DIR=$1 
DEST_DIR=$2 
DAYS=${3:-14}

R="\e[31m" 
G="\e[32m"
Y="\e[33m" 
N="\e[0m" 

LOGS_FOLDER="/var/log/shellscript-logs" 
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) 
LOG_FILE="$LOGS_FOLDER/backup.log"  

mkdir -p $LOGS_FOLDER 

#validation function takes input as exit status, what command they tried to instal 
validate(){
    if [ $? -eq 0 ]
    then 
       echo -e "$2 ... $G SUCCESS $N" | tee -a $LOG_FILE 
    else 
       echo -e "$2 ... $R FAILURE $N" | tee -a $LOG_FILE  
       exit 1  
    fi          
} 
# check whether the root user or not 

if [ $USERID -ne 0 ] 
then 
   echo -e "$R ERROR:: please run the script with root access $N" | tee -a $LOG_FILE 
   exit 1 
else 
   echo -e "you are running with root access" | tee -a $LOG_FILE 
fi 

mkdir -p $LOGS_FOLDER 

usage(){
    echo -e "$R USAGE $N  sh 20-backup.sh <source-dir> <destination-dir> <days(optional)>" | tee -a $LOG_FILE 
    exit 1 
}

if [ $# -lt 2 ] 
then 
    usage
fi 

if [ ! -d $SOURCE_DIR ] 
then 
   echo -e "$R source directory $SOURCE_DIR does not exist please check $N" | tee -a $LOG_FILE 
   exit 1 
fi 

if [ ! -d $DEST_DIR ]  
then 
   echo -e "$R destination directory $DEST_DIR does not exist please check $N" | tee -a $LOG_FILE 
   exit 1 
fi 

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS) 

if  [ ! -z "$FILES" ] 
then 
    echo "Files to zip are: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
   
   if [ -f $ZIP_FILE ]
   then 
      echo -e "successfullly created a zip file" | tee -a $LOG_FILE 

        while IFS= read -r filepath 
        do 
           echo -e "Deleting file: $filepath" | tee -a $LOG_FILE 
           rm -rf $filepath 
        done <<< $FILES 

         echo -e "Log files found older than 14 days from source directory removed ... $Y SUCCESSFULLY $N" | tee -a $LOG_FILE      
   else   
      echo -e "zip file creation ... $R FAILURE $N" | tee -a $LOG_FILE 
      exit 1 
   fi     
else 
   echo -e "No log files found older than 14 days removed... $Y SKIPPING $N" | tee -a $LOG_FILE 
fi       