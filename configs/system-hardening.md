
# Linux System Hardening Guide (RHEL)

![Security](https://img.shields.io/badge/Focus-Security-red)
![Linux](https://img.shields.io/badge/System-RHEL-blue)
![Level](https://img.shields.io/badge/Level-Intermediate-green)

> Practical system hardening techniques applied to a live Linux server to reduce attack surface and improve security posture.

---

## SSH Hardening

### Disable Root Login
```bash
sudo vim /etc/ssh/sshd_config
````

Set:

```
PermitRootLogin no
```

---

### Disable Password Authentication (use SSH keys only)

```
PasswordAuthentication no
```

---

### Change Default SSH Port (optional)

```
Port 2222
```

---

### Restart SSH Service

```bash
sudo systemctl restart sshd
```

---

## Firewall Configuration

### Allow only SSH (restrict access)

```bash
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

### Allow specific IP only (recommended)

```bash
sudo firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="YOUR_IP" port port="22" protocol="tcp" accept'
```

---

## Fail2Ban Concept (Brute Force Protection)

* Monitor failed login attempts
* Block IPs after multiple failures
* Protects against automated brute force attacks

Example logic:

* 5 failed attempts → temporary ban

---

## Service Management

### Disable unnecessary services

```bash
systemctl list-unit-files --type=service
```

```bash
sudo systemctl disable <service>
```

---

## System Updates

Keep system updated:

```bash
sudo dnf update -y
```

---

## File Permissions

Check sensitive files:

```bash
ls -l /etc/shadow
```

Restrict access:

* Only root should have access

---

## Security Insights

* SSH running on `0.0.0.0:22` exposes the system to all networks
* Observed brute force attempts in logs
* Hardening reduces attack surface significantly

---

## Summary

This system was analyzed and hardened by:

* Restricting SSH access
* Monitoring logs for attack patterns
* Applying firewall rules
* Following least privilege principles

---

````

---

## ✅ Commit it

```bash
git add .
git commit -m "Add Linux system hardening guide with SSH and firewall security"
git push
````

--
