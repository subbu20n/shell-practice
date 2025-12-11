#!/bin/bash 

NUMBER1=Subbu 
NUMBER2=10 

Timestamp=$(date) 

echo "script executed at: $Timestamp" 

sum=$(( $NUMBER1 + $NUMBER2 )) 

echo "sum of $NUMBER1 and $NUMBER2 is: $sum"