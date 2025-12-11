#!/bin/bash 

NUMBER=$1 

# -gt greater than 
# -lt less than 
# -eq equal 
# -ne not equal to 

if [ $NUMBER -lt 0 ]:
then 
  echo "Given number $NUMBER is less than 10" 
else
  echo "Given number $NUMBER is not lees than 10" 
fi 