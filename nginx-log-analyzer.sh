#!/bin/bash

LOG_FILE="$1"

if [[ ! -f "$LOG_FILE" ]]; then
  echo "Usage: $0 /path/to/access.log"
  exit 1
fi

echo "Analyzing log file: $LOG_FILE"
echo "---------------------------------------"

# Top 5 IP addresses
echo "🔹 Top 5 IP Addresses:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
echo "---------------------------------------"

# Top 5 requested paths
echo "🔹 Top 5 Requested Paths:"
awk -F\" '{print $2}' "$LOG_FILE" | awk '{print $2}' | sort | uniq -c | sort -nr | head -5
echo "---------------------------------------"

# Top 5 response status codes
echo "🔹 Top 5 Status Codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
echo "---------------------------------------"

# Top 5 user agents
echo "🔹 Top 5 User Agents:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
echo "---------------------------------------"
