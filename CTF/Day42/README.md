.
## Day 42
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Introduction to SIEM**](https://tryhackme.com/room/introtosiem)
[**Logs Fundamentals**](https://tryhackme.com/room/logsfundamentals)

---

Log sources mainly divided into two categories:
- Host-Centric Log Sources : These logs capture event that occurred within or related to the host. Example:
- - A user accessing a file
- - A user attempting to authenticate.
- - A process execution activity
- - A process adding/editing/deleting a registry key or value.
- - PowerShell execution

- Network-Centric Log Sources: When the hosts communicate with each other or access the internet to visit a website.
- - SSH connection
- - A file being accessed via FTP
- - Web traffic
- - A user accessing the company's resources through VPN.
- - Network file sharing Activity

Prorblems with Analysing the log: 
- Numerous Log Sources : Breaking the logs across different devices, and examining them on each device one by one.
- No Centralization : Checking the devices which making the type of logs and examining the device.
- Limit Context : Sinlge logs cannot tell the whole story. During any incident, the single activities on different log sources may seem harmless. But if these logs are correlated, they can indicate a whole different story
- Limited Analysis : Analyzing all the logs from all the devices manually is impossible. Analysts will miss a lot of important logs in between the analyses due to huge number.
- Format Issues : Different log sources generate logs in different formats. Analysts need to know all the formats to analyze them.

Because of this issues, we use SIEM.
First we collect data from the sources, then aggregate the data, the discover and detect the threats, then Identify breaches and investigate alerts

So, SIEM featured:
- Centralized log collection : It just collects all the logs from different sources, instead of jumping one by one and analyzing
- Normalization of logs : making the all the logs in same format by parsing them, so it can scan through without any issue for formats
- Correlation of logs : it finds the relationship between the logs from different sources, so we can detect the malicious activity.
- Real-time Alerting : When the moment the malicious activity is detected, it alerts
- Dashboard and Reporting : Analytics




