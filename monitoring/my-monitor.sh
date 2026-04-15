#!/bin/bash
# My System Monitor
# Author: Hoda Xirsi
# Description: Checks disk, memory and CPU with warnings

echo "===== System Monitor ====="
echo "Date: $(date)"
echo ""

# Disk Check
echo "--- Disk Usage ---"
disk_usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ $disk_usage -ge 80 ]; then
    echo "WARNING: Disk is ${disk_usage}% full"
else
    echo "OK: Disk usage is ${disk_usage}%"
fi
echo ""

# Memory Check
echo "--- Memory Usage ---"
mem_usage=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')
if [ $mem_usage -ge 80 ]; then
    echo "WARNING: Memory is ${mem_usage}% used"
else
    echo "OK: Memory usage is ${mem_usage}%"
fi
echo ""

# Top 3 CPU Processes
echo "--- Top 3 CPU Processes ---"
ps aux --sort=-%cpu | head -4
echo ""

echo "===== Done ====="

