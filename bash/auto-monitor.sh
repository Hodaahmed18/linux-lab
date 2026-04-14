#!/bin/bash

LOG_FILE="$HOME/linux-lab/logs/system.log"
ALERT_FILE="$HOME/linux-lab/logs/alerts.log"

echo "==== Run at $(date) ====" >> $LOG_FILE

# -----------------------------
# Disk Check
# -----------------------------
df -h >> $LOG_FILE

df -h | awk 'NR>1 {print $5 " " $1}' | while read output;
do
  usage=$(echo $output | awk '{print $1}' | sed 's/%//g')
  partition=$(echo $output | awk '{print $2}')

  if [ $usage -ge 80 ]; then
    echo "$(date) WARNING: $partition at ${usage}%" >> $ALERT_FILE
  fi
done

# -----------------------------
# Memory Check
# -----------------------------
mem_used=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

if [ $mem_used -ge 80 ]; then
  echo "$(date) WARNING: Memory usage ${mem_used}%" >> $ALERT_FILE
fi

# -----------------------------
# Top Processes
# -----------------------------
ps aux --sort=-%cpu | head -6 >> $LOG_FILE

# -----------------------------
# Uptime
# -----------------------------
uptime >> $LOG_FILE

echo "" >> $LOG_FILE
