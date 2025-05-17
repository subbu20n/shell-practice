#!/bin/bash

echo " all vaariables passed to the script: $@"
echo "script name: $0"
echo "number of variables: $#"
echo "current directory: $PWD"
echo "user running this script: #USER"
echo "home directory of user:  $HOME"
echo "PID of the script: $$"
      sleep 10&
echo "PID of the last command in bacground: $!"

echo "exit status of last command: $?"