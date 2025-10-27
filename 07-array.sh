#!/bin/bash 

MOVIES=("subbu" "arun" "legend" "veera") 

echo "first movie: ${MOVIES[0]}" 
echo "first movie: ${MOVIES[1]}" 
echo "first movie: ${MOVIES[2]}" 
echo "first movie: ${MOVIES[3]}" 
echo "first movie: ${MOVIES[@]}" 

for i in 0 3 
do 
  echo "movies: ${MOVIES[$i]}" 
done   