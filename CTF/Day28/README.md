## Day 28
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Moniker Link (CVE-2024-21413)**](https://tryhackme.com/room/monikerlink)

**Summary**
Using a `file://` moniker link inside an email hyperlink can cause Outlook to attempt to access a local or network file. This behavior can be abused to force the victim's client to connect to an attacker-controlled SMB endpoint.

**Detection**
- **YARA:** Florian Roth published a YARA rule that detects emails containing the `file:\\` element inside moniker links.
- **Wireshark:** In packet captures you can observe an SMB request originating from the victim to the remote host; the capture may include a truncated NTLMv2 hash.
