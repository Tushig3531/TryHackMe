## Day 63
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Phishing Emails in Action**](https://tryhackme.com/room/phishingemails2rytmuv)
[**Phishing Analysis Tools**](https://tryhackme.com/room/phishingemails3tryoe)
---
From the Phshing Emails in Action the key take away was looking at the email in RAW and investigation code by code instead of trusting what ever it sees.

Checklist of email header:
- Sender email address
- Sender IP address
- Reverse lookup of the sender IP address
- Email subject line
- Recipient email address (this information might be in the CC/BCC field)
- Reply-to email address (if any)
- Date/time

Checklist of email body:
- Any URL links
- The name of the attachment
- The hash value of the attachment
.
---
### Tools
Messageheader from the Google Admin Toolbox --> Per the site, "Messageheader analyzes SMTP message headers, which help identify the root cause of delivery delays. You can detect misconfigured servers and mail-routing problems".

Help us analyze information about the sender's IP address:
- IPinfo.io : can pinpoint our users’ locations, customize their experiences, prevent fraud, ensure compliance, and so much more
- URLScan.io : is a free service to scan and analyse websites. When a URL is submitted to urlscan.io, an automated process will browse to the URL like a regular user and record the activity that this page navigation creates

Online malware sandboxes:
- Any.Run : Analyze a network, file, module, and the registry activity. Interact with the OS directly from a browser. 
- Hybrid Analysis : free malware analysis service for the community that detects and analyzes unknown threats using a unique Hybrid Analysis technology.
- https://www.joesecurity.org/ : Live Interaction, URL Analysis & AI based Phishing Detection, Yara and Sigma rules support, MITRE ATT&CK matrix, AI based malware detection, Mail Monitor, Threat Hunting & Intelligence, Automated User Behavior, Dynamic VBA/JS/JAR instrumentation, Execution Graphs, Localized Internet Anonymization and many more

Automated phishing analysis is PhishTool
PhishTool combines threat intelligence, OSINT, email metadata and battle tested auto-analysis pathways into one powerful phishing response platform