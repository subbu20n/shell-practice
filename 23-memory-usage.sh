#!/bin/bash

memory_info=$(free -m | awk 'NR==2')
total_memory=$(echo "$memory_info" | awk '{print $2}')
used_memory=$(echo "$memory_info" | awk '{print $3}')

if [[ "$total_memory" -gt 0 ]]; then
    memory_percentage=$(echo "scale=2; ($used_memory * 100) / $total_memory" | )
    echo "Memory Usage: ${used_memory}MB / ${total_memory}MB (${memory_percentage}%)"
else
    echo "Error: Total memory is zero or not available."
fi