# 🐧 RHEL Cloud Monitoring & Security Lab

![Linux](https://img.shields.io/badge/Linux-RHEL-red)
![Cloud](https://img.shields.io/badge/Cloud-AWS-orange)
![Focus](https://img.shields.io/badge/Focus-DevOps%20%7C%20Security-blue)

> Hands-on Linux and cloud engineering lab built on AWS EC2, focused on system monitoring, security analysis, and automation using real-world scenarios.

---

## 🚀 Project Overview

This project simulates a production-like Linux environment where I:

- Monitored system performance (CPU, memory, disk)
- Detected and analyzed brute force SSH attacks
- Built automated monitoring and alerting scripts
- Inspected live networking configurations
- Applied system hardening techniques

All work is based on **real commands and outputs from a live RHEL server**.

---

## 🖥️ Environment

| Component | Detail |
|----------|--------|
| OS | Red Hat Enterprise Linux 10.1 |
| Cloud | AWS EC2 (t4g.micro) |
| Region | eu-north-1 |
| Architecture | ARM64 |
| Access | SSH (key-based authentication) |

---

## 📂 Repository Structure

| Folder | Description |
|--------|------------|
| `monitoring/` | System health scripts (CPU, memory, disk) |
| `bash/` | Automated monitoring + alerting scripts |
| `logs/` | SSH log analysis & brute force detection |
| `networking/` | Network inspection and analysis |
| `services/` | Service management with systemctl |
| `configs/` | System hardening and security practices |

---

## 🔧 Key Projects

### 🔍 System Monitoring
- Built `system-health.sh` to inspect system resources
- Identified system uptime, load, and top processes

### ⚙️ Automation & Alerting
- Developed `auto-monitor.sh`
- Logs system metrics and triggers alerts based on thresholds
- Simulates real-world monitoring workflows

### 🔐 Security Analysis
- Used `journalctl` to detect brute force SSH attempts
- Identified repeated failed logins from a single IP
- Documented attack patterns and mitigation strategies

### 🌐 Networking
- Analyzed live network configuration using `ip`, `ss`, and `curl`
- Identified open ports and security exposure (`0.0.0.0:22`)

### 🛡️ System Hardening
- Implemented SSH security best practices
- Designed firewall rules and access restrictions
- Applied least privilege principles

---

## 🚨 Key Takeaways

- Gained hands-on experience with Linux system monitoring and debugging
- Understood real-world attack patterns and system vulnerabilities
- Built reusable Bash automation tools
- Applied security best practices to reduce attack surface

---

## 🛠️ Tech Stack

- Linux (RHEL 10)
- AWS EC2
- Bash scripting
- systemd (`journalctl`, `systemctl`)
- Networking tools (`ip`, `ss`, `curl`)
- Git & GitHub

---

## 📜 Certifications

| Certification | Status |
|--------------|--------|
| RHCSA | ✅ Certified |
| AWS Cloud Practitioner | 🔄 In Progress |
| AWS Solutions Architect Associate | 📅 Planned |

---

## 📌 Future Improvements

- Add cron-based automation
- Implement alert notifications (email/webhook)
- Integrate with monitoring tools (e.g. Prometheus)

---
