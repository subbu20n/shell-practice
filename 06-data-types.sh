#!/bin/bash 

NUMBER1=100 
NUMBER2=200 

TIMESTAMP=$(date) 

echo "script executed at: $TIMESTAMP" 

SUM=$(($NUMBER1 + $NUMBER2)) 
echo "sum of $number1 and $number2: $SUM" 