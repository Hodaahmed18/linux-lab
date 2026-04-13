#!/bin/bash

#Script for monitoring RHEL systems


echo "==== System Health Check ===="
echo "Date: $(date)"
echo ""

echo "--- Disk Usage ---"
df -h 
echo ""


echo " --- Memory ---"
free -h 
echo ""

echo " --- Top 5 CPU Processes ---" 
ps aux --sort=-%cpu | head -6
echo ""

echo " --- Uptime --- "
uptime 
echo ""


