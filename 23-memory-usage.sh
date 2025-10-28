#!/bin/bash

# Get total and used memory in MB
read total used <<< $(free -m | awk 'NR==2 {print $2, $3}')

# Calculate percentage (integer only)
if [[ "$total" -gt 0 ]]; then
    memory_percentage=$(( used * 100 / total ))
    echo "Memory Usage: ${used}MB / ${total}MB (${memory_percentage}%)"
else
    echo "Error: Total memory not available."
fi
