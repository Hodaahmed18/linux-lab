

---

### 
# Linux Networking Basics

![Linux](https://img.shields.io/badge/Linux-RHEL-red)
![Networking](https://img.shields.io/badge/Focus-Networking-blue)
![Level](https://img.shields.io/badge/Level-Beginner--Intermediate-green)

> Practical networking inspection and analysis performed on a live Linux (RHEL) system using core networking tools.

---

## Core Commands

| Command | Purpose |
|--------|--------|
| `ip a` | Show IP addresses and network interfaces |
| `ip route` | Display routing table and default gateway |
| `ss -tuln` | Show listening ports and active sockets |
| `ping` | Test network connectivity |
| `curl -I` | Fetch HTTP headers from a remote server |

---

## Real Output from Live Server

### Network Interfaces (`ip a`)
```bash
inet 172.31.10.43/20 brd 172.31.15.255 scope global dynamic noprefixroute ens5
````

### Routing Table (`ip route`)

```bash
default via 172.31.0.1 dev ens5 proto dhcp src 172.31.10.43
```

### Open Ports (`ss -tuln`)

```bash
tcp LISTEN 0 128 0.0.0.0:22
tcp LISTEN 0 128 [::]:22
```

### Connectivity Test (`ping`)

```bash
4 packets transmitted, 4 received, 0% packet loss
```

### HTTP Response (`curl -I`)

```bash
HTTP/2 301
location: https://www.google.com/
```

---

## Key Concepts

### Public vs Private IP

* `172.31.x.x` is a **private IP address** (internal network)
* Used in cloud environments like AWS

### Default Gateway

* `172.31.0.1` is the gateway
* Routes traffic from the local network to the internet

### Open Ports & Security

* `0.0.0.0:22` means SSH is listening on **all interfaces**
* This allows any IP to attempt a connection
* Common target for brute force attacks

### Connectivity Validation

* `ping` confirms network reachability
* `curl` confirms application-layer (HTTP/HTTPS) connectivity

---

## Security Insight

The system is reachable over SSH from any IP (`0.0.0.0:22`), which increases exposure to automated attacks. In production environments, access should be restricted using firewall rules (e.g., allow only trusted IP addresses).

---


