#!/bin/bash

set -e

echo "hello morning"

echooooo "good morning"

echo "subbu"

failure(){
    echo "failed at: $1 $2 "
}

trap 'failure "${LINENO}" "${BASH_COMMAND}" ERR'