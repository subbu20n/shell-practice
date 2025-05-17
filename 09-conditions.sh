#!/bin/bash

NUMBER=$1
# -lt less tthan
# -gt greater than
# -eq equal
# -nq not equal

if [ $NUMBER -lt 10 ]
then 
    echo "given number $NUMBER is less  than 10"
else 
    echo "given number $NUMBER is not less than 10"
fi    
