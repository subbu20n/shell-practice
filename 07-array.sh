#!/bin/bash 

MOVIES=("subbu" "arun" "legend" "simha") 

echo "first movie: ${MOVIES[0]}" 
echo "first movie: ${MOVIES[1]}" 
echo "first movie: ${MOVIES[2]}" 
echo "first movie: ${MOVIES[3]}" 
echo "first movie: ${MOVIES[@]}" 

for i in 0 3 
do 
  echo "movie: ${MOVIES[$i]}" 
done   