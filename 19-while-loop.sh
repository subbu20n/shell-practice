#!/bin/bash 
a = 5 
while [ $a -lt 10 ] 
do 
  echo $a 
  a = `expr $a +1`
done 