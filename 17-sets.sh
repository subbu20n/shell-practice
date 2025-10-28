#!/bin/bash 

set -e 
failure(){
    echo "failed at: $1 $2"
}
trap 'failure "${LINENO}" "${BASH_COMMAND}"' ERR 

echo "Hello world" 
echooo "Hello world" 
echo "Hello subbu" 
