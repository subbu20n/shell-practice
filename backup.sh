#!/bin/bash

USERID=$(id -u)
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # by default taking 14 days

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(find $SOURCE_DIR -name "*.log" -mtime +14)
LOG_FILE="$LOGS_FOLDER/backup.log"

mkdir -p $LOGS_FOLDER
echo "script started executed at: $(date)" | tee -a $LOG_FILE

#check the user has root privileges or not
if [ $USERID -ne 0 ]
then 
   echo -e "$R ERROR:: please run this script with root access $N" | tee -a $LOG_FILE
   exit 1 # give other tha 0 upto 127
else
    echo -e "you are running with root access" |  tee -a $LOG_FILE
fi 

# validate function takes input as exit status what command they tried to install
VALIDATE(){
if [ $1 -eq 0 ]
then 
    echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
else
    echo -e "INstalling $2 is ... $R FAILURE $N" | tee -a $LOG_FILE
    exit 1
fi 
}

usage(){
    echo -e "$R USAGE:: $N sudo sh backup.sh <source directory> <destination directory> <days(optional)>"
    exit 1
}

if [ $# -lt 2 ]
then 
    usage
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "source directory $SOURCE_DIR does not exist please check $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then 
    echo -e "destination directory $DEST_DIR does not work please check $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime $days)
if [ ! -z "$FILES" ]
then 
    echo "files to zip are: $FILES"
