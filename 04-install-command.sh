#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 0 ]
then
    echo "given number $NUMBER is less than 10"
else 
    echo "given number $NUMBER is not less than 10"
fi    