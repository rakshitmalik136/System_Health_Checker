# System Health Checker (DevOps Project)

## Overview

A lightweight DevOps monitoring tool built using **Bash** that continuously checks system health (CPU, Memory, Disk) and generates alerts when thresholds are exceeded.

---

## Features

- CPU, Memory, Disk usage monitoring
- Threshold-based alert system
- Email alert support (configurable)
- Logging system (persistent logs)
- Cron job compatible (automated execution)

---

## Tech Stack

- **Linux** (Fedora/Ubuntu)
- **Bash Scripting**

---

## How It Works

1. Script collects system metrics
2. Compares with predefined thresholds
3. Generates alerts if limits exceeded
4. Logs all activity into a log file
5. *(Optional)* Sends email notification

---

## Project Structure

```
System_Health_Checker/
│── script.sh
│── system_health.log
│── README.md
```

---

## How to Run

```bash
chmod +x script.sh
./script.sh
```

## Cron -- for scheduling

```bash
crontab -e
*/5 * * * * /home/user/health_check.sh
```

---

## Sample Output

```
===== SYSTEM HEALTH REPORT =====

CPU Usage: 91%
Memory Usage: 65%
Disk Usage: 88%

🚨 ALERT: HIGH RESOURCE USAGE 🚨
CPU Usage is above 80% (Current: 91%)

Time: Wed Apr 15 10:40:00 IST 2026
================================
```

---

## Future Improvements

- Add Slack/Discord alerts
- Build web dashboard
- Integrate with Docker containers

---

## Author

**Rakshit Malik**
