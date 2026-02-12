#!/bin/bash 

NUMBER1=Subbu # here string is subbu , string ni addition cheyalemu kabatti we cannot add string ok. 
NUMBER2=200 

TIMESTAMP=$(date) 

echo "script executed at: $TIMESTAMP" 

SUM=$(($NUMBER1 + $NUMBER2)) 
echo "sum of $NUMBER1 and $NUMBER2: $SUM" 