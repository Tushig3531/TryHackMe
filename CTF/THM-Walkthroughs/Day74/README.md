## Day 74
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Wireshark: Traffic Analysis**](https://tryhackme.com/room/wiresharktrafficanalysis)
---
To learn more deeply, I started writing everything down to get a better understanding.
Today I learned about NetBIOS and Kerberos, and how to analyze them in Wireshark.

NetBIOS is an older networking system that helps computers on a local network find each other and share resources like files and printers. In most modern Windows networks, it has largely been replaced by DNS and Active Directory, and SMB typically uses TCP 445 (direct hosting) instead of going through NetBIOS. NetBIOS mainly provides three services: name service (lets devices use names instead of IP addresses), session service (sets up and manages connections for sharing), and datagram service (supports simple broadcast-style messages on the local network).

Kerberos is the default authentication protocol for Microsoft domains (Active Directory). Its key feature is that it authenticates users using tickets and session keys, so the user’s password is not sent over the network, even in untrusted environments.
---
[View my Day 74 notes (PDF)](Netbios-Kerberos-analysis_Identifying-Hosts_Wireshark_Traffic-Analysis.pdf)