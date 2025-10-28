#!/bin/bash 
set -e
  


 failure (){
    echo "failed at: $1 $2" 
 }

 trap 'failure "${LINENO}" "${BASH_COMMAND}"' ERR 

 echo "Hello good morning" 

echoo "Hello good morning" 
 echo "Hello subbu"