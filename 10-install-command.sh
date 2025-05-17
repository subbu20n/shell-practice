#!/bin/bash

USERID=$(id -u)

if [ $NUMBER -eq 0 ]
then
   echo "ERROR:: please run this script with root acces"
else
   echo "you are running with root access"
fi
