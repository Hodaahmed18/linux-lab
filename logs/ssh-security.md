i# 🔍 SSH Log Monitoring

![RHEL](https://img.shields.io/badge/OS-RHEL%2010-red?style=flat-square&logo=redhat)
![Tool](https://img.shields.io/badge/Tool-journalctl-black?style=flat-square&logo=gnubash)
![Security](https://img.shields.io/badge/Focus-Security%20Monitoring-blue?style=flat-square)

> Using journalctl to monitor SSH logs, detect brute force attacks and verify server security on a live RHEL EC2 instance.

---

## 📖 What is journalctl?

journalctl is the command used to read logs from systemd's journal — the central logging system on RHEL and most modern Linux distributions. Every service managed by systemd writes its logs here, making it the first place to look when something goes wrong.

Key concepts:
- `-u` — unit. Specifies which systemd service to read logs from
- `-p` — priority. Filters by severity level (emerg, alert, crit, err, warning, notice, info, debug)
- `--since` — time filter. Narrows logs to a specific timeframe

---

## 🔧 Key Commands

| Command | Purpose |
|---------|---------|
| `journalctl -u sshd` | Show all SSH service logs |
| `journalctl -u sshd --since "1 hour ago"` | SSH logs from last hour |
| `journalctl -p err --since today` | All errors since today |
| `journalctl -p err --since yesterday` | All errors since yesterday |
| `journalctl --since today` | All system logs today |

---

## 🔐 Real World Example — Brute Force Attack

Running `journalctl -p err --since yesterday` on this live EC2 instance revealed a clear brute force attack pattern:
Apr 12 09:59:14 rhel sshd-session: error: maximum authentication attempts exceeded
Apr 12 09:59:16 rhel sshd-session: error: maximum authentication attempts exceeded
Apr 12 09:59:18 rhel sshd-session: error: maximum authentication attempts exceeded

**What this means:** An automated bot hit the SSH port repeatedly, trying different credentials in rapid succession from the same IP address. SSH's built-in limit blocked each attempt automatically.

**Why the server stayed secure:** Key-based authentication was enforced — no password means nothing to brute force. The attacker had no way in regardless of how many attempts were made.

---

## ✅ Verified Login History

Cross-referencing with successful logins confirmed only legitimate access:
- All accepted connections used the correct SSH key fingerprint
- All source IPs traced back to UK addresses (London/library)
- Zero unauthorised access confirmed
