#!/bin/bash

# Script for monitoring RHEL Systems




#!/bin/bash

echo "==== System Health Check ===="
echo "Date: $(date)"
echo ""

# -----------------------------
# Disk Usage Check
# -----------------------------
echo "--- Disk Usage ---"
df -h
echo ""

# Alert if disk > 80%
echo "--- Disk Alerts ---"
df -h | awk 'NR>1 {print $5 " " $1}' | while read output;
do
  usage=$(echo $output | awk '{print $1}' | sed 's/%//g')
  partition=$(echo $output | awk '{print $2}')

  if [ $usage -ge 80 ]; then
    echo "WARNING: $partition is at ${usage}% usage"
  fi
done
echo ""

# -----------------------------
# Memory Check
# -----------------------------
echo "--- Memory Usage ---"
free -h
echo ""

# Alert if memory usage high
mem_used=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')
if [ $mem_used -ge 80 ]; then
  echo "WARNING: Memory usage is at ${mem_used}%"
else
  echo "Memory usage is normal: ${mem_used}%"
fi
echo ""

# -----------------------------
# CPU Processes
# -----------------------------
echo "--- Top 5 CPU Processes ---"
ps aux --sort=-%cpu | head -6
echo ""

# -----------------------------
# Uptime & Load
# -----------------------------
echo "--- Uptime ---"
uptime
echo ""

# -----------------------------
# Active Users
# -----------------------------
echo "--- Logged in Users ---"
who
echo ""

echo "==== Health Check Complete ===="


