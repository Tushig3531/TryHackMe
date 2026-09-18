## Day 110
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Elastic: Using Elastic Defend**](https://tryhackme.com/room/elasticdefend)

---

> Today, I am learning Elastic.
Elastic Defend protects our endpoints by collecting telemetry from processes, files, network activity, and more. Using that data, it can detect suspicious behavior, prevent malicious activity, and provide actionable insights for investigation and response.

Because it works closely with system processes and files, it can deliver endpoint detection and response (EDR), next generation anti-virus (NGAV) protection, and behavioral monitoring.

### How Elastic Defend Works

It has two distinct capabilities: endpoint telemetry collection and endpoint protection.

- **Telemetry Collector (Event Visibility)** : Collects and forwards endpoint activity (process, file, network) for visibility and investigation, without taking preventive action
- **NGAV/EDR (Prevention and Detection)** : Provides malware detection, ransomware and memory protection, credential theft defense, and the ability to prevent or block malicious activity in real time

Rather than relying solely on known malware signatures, it monitors real time system behavior. This includes processes, file activity, memory usage, and network connections, so it can identify both known threats and suspicious techniques used by attackers.

### Elastic Defend Logging Capabilities

| Monitoring Type | What It Captures | Key Fields |
|---|---|---|
| File Activity | File creation, modification, deletion | File paths, names, hashes, sizes, and associated processes |
| Network Activity | Outbound connections, IPs, ports, protocols | Source and destination IP addresses, ports, protocols, associated processes, and connection direction |
| Process Activity | Process starts/stops, command lines, parent-child relationships | Process name, command line, parent process, execution path, and user context |

### Process Lifecycle Phases

When Elastic Defend collects process telemetry data, it tracks different lifecycle phases of the process.

- `[fork, exec, end]` : Displays the combined lifecycle actions recorded. This indicates the process was created, executed, and later terminated
- **fork** : Process creation
- **uid_change** : Process changed security context due to a sudo command in the script, temporarily elevating privileges to root

### Alerts

- Telemetry shows us what happened, alerts tell us what requires attention
- Elastic Security provides a centralized Alerts dashboard
- On the Security Alert page, we can find existing alerts. Underneath it, we can do the full analysis



---

<!-- ![Badge](badge.png) -->