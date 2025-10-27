#!/bin/bash 

NUMBER=$1 
# -gt greater than 
# -lt less than 
# -eq eaqual 
# -ne not equal

if [$NUMBER -lt 10] {
    echo "given number $NUMBER is less than 10" 
   else 
   echo " given number $NUMBER is not less than 10" 
fi    