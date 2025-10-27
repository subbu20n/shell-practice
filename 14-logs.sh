#bin/bash 

USERID=$(id -u) 

R="\e[31m" 
G="\e[32m" 
Y="\e[33m"
N="\e[0m" 

LOGS_FOLDER="/var/log/shellscripts-logs" 
SCRIPT_NAME="$(echo $0| cut -d "." -f1)" 
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

mkdir -p $LOGS_FOLDER 

echo -e "script started executed at: $(date)"   &>> $LOG_FILE 

if [ $USERID -ne 0 ] 
then 
  echo -e "$R ERROR:: please run this script with root access"  &>> $LOG_FILE 
  exit 1 
else 
  echo "you are running with root access"   &>> $LOG_FILE 
fi 

#validate function takes input as exit status, what command they tried to install 
validate(){
    if [ $1 -eq 0 ] 
    then 
       echo -e "Installing $2 is ... $G SUCCESS $N"   &>> $LOG_FILE 
    else 
       echo -e "Installing $2 is ... $R FAILURE $N"    &>> $LOG_FILE 
       exit1 
    fi       
}

dnf list installed mysql   &>> $LOG_FILE 
if [ $? -ne 0 ]
then 
  echo -e "mysql is not installed ... going to install"  &>> $LOG_FILE 
  dnf install mysql -y  &>> $LOG_FILE 
  validate $? "MYSQL" 
else 
  echo -e "Nothing to do MYSQL ... $Y already installed $N"  &>> $LOG_FILE 
fi     

dnf list installed python3  &>> $LOG_FILE 
if [ $? -ne 0 ]
then 
  echo -e "python3 is not installed ... going to install"  &>> $LOG_FILE 
  dnf install python3 -y &>> $LOG_FILE 
  validate $? "PYTHON3" 
else 
  echo -e "Nothing to do PYTHON3 ... $Y already installed $N" &>> $LOG_FILE 
fi     

dnf list installed nginx &>> $LOG_FILE 
if [ $? -ne 0 ]
then 
  echo -e "nginx is not installed ... going to install" &>> $LOG_FILE 
  dnf install mysql -y  &>> $LOG_FILE 
  validate $? "NGINX" 
else 
  echo -e "Nothing to do nginx ... $Y already installed $N"  &>> $LOG_FILE 
fi     