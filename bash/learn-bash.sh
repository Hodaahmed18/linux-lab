#!/bin/bash

echo "===== Service Status Check ======"


for service in sshd crond firewalld; do 
	if systemctl is-active --quiet $service; then 
		echo "OK: $service is running"
	else
		echo "WARNING: $service is NOT running"

	fi
done 
