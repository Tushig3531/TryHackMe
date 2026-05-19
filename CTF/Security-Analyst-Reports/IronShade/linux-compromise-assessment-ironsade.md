# Linux Compromise Assessment Report

## 1. Executive Summary

A Linux server was investigated after threat intelligence indicated that exposed Linux systems were being targeted by a known threat group.

The investigation found multiple signs of compromise, including:

- An unauthorized backdoor user account
- Cron-based persistence
- A hidden suspicious process
- Suspicious system services
- Repeated SSH login activity
- A suspicious package installed on the host

Based on these findings, the host should be treated as compromised.

---

## 2. Investigation Objective

The goal of this investigation was to identify signs of attacker activity on the Linux server.

The investigation focused on:

- User account activity
- Persistence mechanisms
- Running processes
- Installed services
- SSH authentication logs
- Installed packages

---

## 3. Environment

| Category | Details |
|---|---|
| Platform | TryHackMe Linux compromise assessment lab |
| System Type | Linux server |
| Role | Security Analyst |
| Investigation Type | Compromise assessment |

---

## 4. Key Findings

| Finding | Description | Evidence |
|---|---|---|
| Backdoor account discovered | A suspicious user account was created and may have been used for attacker access. | `mircoservice` |
| Cron persistence identified | A cron job was configured to run an attacker-controlled binary when the system reboots. | `@reboot /home/mircoservice/printer_app` |
| Hidden process found | A suspicious hidden process was running on the system. | `.strokes` |
| Suspicious services installed | Suspicious services were installed and may have been used for persistence or execution. | `backup.service`, `strokes.service` |
| SSH activity observed | SSH activity was associated with the suspicious account. | `10.11.75.247` |
| Suspicious package discovered | A suspicious package was installed on the host. | `pscanner` |

---

## 5. Timeline of Activity

| Time | Event |
|---|---|
| Aug 5 22:05:33 | The suspicious user account `mircoservice` was created. |
| After account creation | A cron persistence mechanism was configured. |
| After persistence setup | Suspicious services and a hidden process were observed. |
| Later activity | Multiple SSH login attempts were observed from `10.11.75.247`. |

---

## 6. Evidence and Analysis

### Backdoor User Account

The user account `mircoservice` was identified during the investigation.

This account appears suspicious because it was created during the compromise timeline and does not appear to be a normal system account. It may have been created by the attacker to maintain access to the server.

**Evidence:**

```
mircoservice
```

**Why this matters:**

Backdoor accounts allow attackers to regain access even if the original method of compromise is removed.

---

### Cron Persistence

A cron job was configured to run a binary from the suspicious user's home directory when the system reboots.

**Evidence:**

```
@reboot /home/mircoservice/printer_app
```

**Why this matters:**

The `@reboot` cron entry allows the suspicious program to start automatically whenever the server restarts. This is a common persistence technique.

---

### Suspicious Hidden Process

A hidden process named `.strokes` was observed on the system.

**Evidence:**

```
.strokes
```

**Why this matters:**

Files or processes that begin with a dot are hidden from normal directory listings. Attackers may use hidden names to make malicious activity harder to notice.

---

### Suspicious Services

Two suspicious services were identified on the system.

**Evidence:**

```
backup.service
strokes.service
```

**Why this matters:**

System services can be used to automatically start programs in the background. These services may have been used to maintain persistence or execute attacker-controlled code.

---

### SSH Authentication Activity

SSH activity was observed from the IP address `10.11.75.247`.

**Evidence:**

```
10.11.75.247
```

**Why this matters:**

Repeated SSH login attempts can indicate brute-force activity, attacker testing, or attempts to access the backdoor account.

---

### Suspicious Package

A suspicious package named `pscanner` was installed on the host.

**Evidence:**

```
pscanner
```

**Why this matters:**

Unexpected or malicious packages can install attacker tools, persistence mechanisms, or additional payloads on the system.

---

## 7. Indicators of Compromise

| Type | Indicator |
|---|---|
| User account | `mircoservice` |
| Cron persistence | `@reboot /home/mircoservice/printer_app` |
| Hidden process | `.strokes` |
| Suspicious service | `backup.service` |
| Suspicious service | `strokes.service` |
| SSH source IP | `10.11.75.247` |
| Suspicious package | `pscanner` |

---

## 8. Severity

**Severity: High**

The host showed several signs of compromise, including unauthorized account creation, persistence through cron, suspicious services, a hidden process, SSH activity, and a suspicious installed package.

Because multiple persistence methods were found, the system should not be trusted until it has been fully remediated or rebuilt.

---

## 9. Recommended Response Actions

The following response actions are recommended:

1. Disable or remove the `mircoservice` account.
2. Kill the suspicious `.strokes` process.
3. Remove the cron entry:
   ```
   @reboot /home/mircoservice/printer_app
   ```
4. Disable and remove the suspicious services:
   ```
   backup.service
   strokes.service
   ```
5. Remove the suspicious package:
   ```
   pscanner
   ```
6. Review SSH logs for:
   - Additional source IP addresses
   - Successful logins
   - Failed login attempts
   - Activity involving `mircoservice`
7. Rotate credentials for affected users.
8. Block `10.11.75.247` if confirmed malicious.
9. Review the host for additional persistence mechanisms.
10. Rebuild the server from a known-good image if compromise is confirmed.

---

## 10. Lessons Learned

This investigation improved my ability to perform a Linux compromise assessment by reviewing user accounts, cron jobs, running processes, services, SSH authentication logs, and installed packages.

It also reinforced the importance of checking multiple evidence sources before reaching a conclusion. In this case, the combination of a backdoor account, cron persistence, suspicious services, a hidden process, SSH activity, and a suspicious package strongly supported the conclusion that the host was compromised.

---

## 11. Badge
![badge](badge.png)