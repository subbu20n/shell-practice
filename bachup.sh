#!/bin/bash

USERID=$(id -u)
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=$(3:-14)

    R="\e[31m"
    G="\e[32m"
    Y="\e[33m"
    N="\e[0m"

    LOGS_FOLDER="/var/log/shellscript-logs"
    SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
    LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

    mkdir -p $LOGS_FOLDER
    echo "script started execution at: $(date)" | tee -a $LOG_FILE

    if [ $USERID -ne 0 ]
    then
       echo -e "$R ERROR:: please run this script with root access $N" | tee -a $LOG_FILE
       exit 1
    else 
        echo  "you are running with roo access" | tee -a $LOG_FILE
    fi 

    # Validate function takes input as exit status what command tried to install
    VALIDATE(){
        if [ $1 -eq 0 ]
        then
            echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE 
        else 
             echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE 
        fi         
    }   

     usage(){
        echo -e "$R USAGE:: $N sh backup.sh <source directory> <destination directory> <days(optional)>"
        exit 1
     }

     if [ $# -lt 2 ]
     then 
        usage
     fi

     if [ ! -d $SOURCE_DIR ]
     then
         echo -e "$R source directory $SOURCE_DIR does not exist please check $N"
         exit 1
     fi

     if [ ! -d $DEST_DIR ]
     then
        echo -e "$R desination directory $DEST_DIR does not exist please check $N"
     fi

     FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14) 
     if [ ! -z "$FILES" ]
     then 
         echo "FILES to zip are: $FILES"
         TIMESTAMP=$(date +%F +%H +%s +%M)
         ZIP_FILE=$DEST_DIR/app-logs -TIMESTAMP.zip
         find $SOURCE_DIR -name "*.log" -mtime +14 | zip -@ "$ZIP_FILE"
     if [ -f "$ZIP_FILE" ]
     then
         echo "successfully creating zip file"

     while IFS= read -r filepath
     do 
       echo "Deleting file: $filepath"

       rm -rf $filepath
     done <<< $FILES 
        echo -e "log files older than $days from source directory removed ... $G successfully $N"
     else 
        echo -e "zip file creation ... $R FAILURE $N"
     fi 
     else 
        echo -e "no log files found older than $days ... $Y Skipping $N"
     f                   

