#!/bin/bash 

echo "all  variables passed to the script: $@" 
echo "number of variables passed to the script: $#" 
echo "script name: $0" 
echo "present working directory: $PWD" 
echo "home directory of the user who is running the script: $HOME" 
echo "which user running the script: $USER" 
echo "PID of the current script: $$" 
sleep 10&
echo "PID of last command running in background: $!" 
echo "exit status of last command: $?" 