#!/bin/bash

if [ $USERID -ne 0 ]
then
    echo "ERROR :: please run this script with root access"
else 
    echo "run this script with root access"
fi        