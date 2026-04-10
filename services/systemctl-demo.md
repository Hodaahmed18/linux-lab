# Service Management with systemctl

## What is systemctl?

systemctl is the command used to manage services on RHEL and most modern Linux systems.
A service is a background process that runs continuously - like SSH, a web server, or a database.

## Core Commands

| Command | What it does |
|---------|-------------|
| `systemctl status <service>` | Check if a service is running |
| `systemctl start <service>` | Start a service |
| `systemctl stop <service>` | Stop a service |
| `systemctl restart <service>` | Restart a service |
| `systemctl enable <service>` | Start service automatically on boot |
| `systemctl disable <service>` | Stop service starting on boot |
| `systemctl list-units --type=service` | List all services |

## Real Examples

### Check SSH service status
systemctl status sshd
# Shows: active (running), enabled on boot, recent connection logs

### List all running services
systemctl list-units --type=service --state=running

### Check SSH service status
systemctl status sshd

### List all running services

systemctl list-units --type=service --state=running

### Restart a service
sudo systemctl restart sshd

### Enable a service to start on boot
sudo systemctl enable sshd

### Disable a service from starting on boot
sudo systemctl disable <service-name>

Linux systems do not inherently notify administrators of performance or failure issues.
Monitoring services provide real-time visibility into system resources and health.
They enable early detection and proactive resolution of potential problems.
Without monitoring, system management becomes reactive and less reliable.


