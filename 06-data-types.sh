#!/bin/bash 

NUMBER1=SUBBU 
NUMBER2=200 

TIMESTAMP=$(date) 

echo "script executed at: $TIMESTAMP" 

SUM=$(($NUMBER1 + $NUMBER2)) 
echo "sum of $NUMBER1 and $NUMBER2: $SUM" 