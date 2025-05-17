#!/bin/bash

echo "all variables passed to the script: $@"
echo "number of variables passed: $#"
echo "script name:$0"
echo "present woorking directory: $PWD"
echo "home directory of the user of the script: $HOME"
echo "which user running the script: $USER"
echo "pid of the current script: $$"
sleep 10 &
echo "pid of the last command in background: $!"
echo "exit status of previous command: $?"