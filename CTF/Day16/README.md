## **Room:** [Source](https://tryhackme.com/room/source)
### [**Streak**](https://tryhackme.com/Tushig3531/streak) 
---
> **Prompt**
>
> > Enumerate and root the box attached to this task. Can you discover the source of the disruption and leverage it to take control?

Host: 10.201.101.23
## Walkthrough
First, I scanned for open ports using nmap:
```bash
nmap -sS -sV 10.201.101.23
```
Result: 22, 10000
The service on port 10000 identified itself as MiniServ 1.890. Port 10000 was accessible, so I searched the site for more information but found nothing.
Next, I searched for directories:
```bash
gobuster dir -u https://10.201.101.23:10000 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
```
Unfortunately, that did not work. I found nothing and received this message:
```text
Error: error on running gobuster: unable to connect to https://10.201.101.23:10000/: Get "https://10.201.101.23:10000/": tls: failed to verify certificate: x509: certificate has expired or is not yet valid: current time 2025-10-08T01:14:18+01:00 is after 2025-06-25T04:42:03Z
```
This basically means gobuster could not connect to the target because the HTTPS certificate is invalid or expired.


Based on the only clue, I identified **Webmin and MiniServ 1.890**. I searched the internet for known exploits and found relevant information on Webmin’s security page. Eventually, I started Metasploit and searched for Webmin modules and found exactly what I needed: **webmin_backdoor**.
TI set LHOST, RHOST, and adjusted the SSL option, then launched the exploit. After exploitation I couldn't easily navigate the shell, so I checked for Python and—after confirming it was available—ran:
```bash
python -c "import pty;pty.spawn('/bin/bash')"
```
which I learned yesterday.

That gave me a proper interactive shell. I then gained full root access and found the flags.


user.txt: THM{SUPPLY_CHAIN_COMPROMISE}
root.txt: THM{UPDATE_YOUR_INSTALL}

