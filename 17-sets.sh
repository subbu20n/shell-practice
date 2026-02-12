#!/bin/bash 

#set -e # when we set -e it exit the when error comes orelse we dont keep set -e whenther error comes also it moves forward in shell
failure(){
    echo "failed at: $1 $2"
}
trap 'failure "${LINENO}" "${BASH_COMMAND}"' ERR 

echo "Hello world" 
echooo "Hello world" 
echo "Hello subbu" 
 
