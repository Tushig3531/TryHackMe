
## **Room:** [Intermediate Nmap](https://tryhackme.com/room/intermediatenmap)

> **Prompt**
>
> >You've learned some great nmap skills! Now can you combine that with other skills with netcat and protocols, to log in to this machine and find the flag? This VM MACHINE_IP is listening on a high port, and if you connect to it it may give you some information you can use to connect to a lower port commonly used for remote access!

> > Access this challenge by deploying both the vulnerable machine by pressing the green "Start Machine" button located within this task, and the TryHackMe AttackBox by pressing the  "Start AttackBox" button located at the top-right of the page.

> > Use the AttackBox to scan the target: MACHINE_IP

---
##Walkthrough
I used the command:
```bash
nmap -sV -sS 10.201.77.239
```
and I got this result:
```text
Starting Nmap 7.80 ( https://nmap.org ) at 2025-10-02 03:41 BST
mass_dns: warning: Unable to open /etc/resolv.conf. Try using --system-dns or specify valid servers with --dns-servers
mass_dns: warning: Unable to determine any DNS servers. Reverse DNS is disabled. Try using --system-dns or specify valid servers with --dns-servers
Nmap scan report for intermediate.thm (10.201.77.239)
Host is up (0.00011s latency).
Not shown: 997 closed ports
PORT      STATE SERVICE VERSION
22/tcp    open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.4 (Ubuntu Linux; protocol 2.0)
2222/tcp  open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.4 (Ubuntu Linux; protocol 2.0)
31337/tcp open  Elite?
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port31337-TCP:V=7.80%I=7%D=10/2%Time=68DDE645%P=x86_64-pc-linux-gnu%r(N
SF:ULL,35,"In\x20case\x20I\x20forget\x20-\x20user:pass\nubuntu:Dafdas!!/st
SF:r0ng\n\n")%r(GetRequest,35,"In\x20case\x20I\x20forget\x20-\x20user:pass
SF:\nubuntu:Dafdas!!/str0ng\n\n")%r(SIPOptions,35,"In\x20case\x20I\x20forg
SF:et\x20-\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n")%r(GenericLines,35,"I
SF:n\x20case\x20I\x20forget\x20-\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n"
SF:)%r(HTTPOptions,35,"In\x20case\x20I\x20forget\x20-\x20user:pass\nubuntu
SF::Dafdas!!/str0ng\n\n")%r(RTSPRequest,35,"In\x20case\x20I\x20forget\x20-
SF:\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n")%r(RPCCheck,35,"In\x20case\x
SF:20I\x20forget\x20-\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n")%r(DNSVers
SF:ionBindReqTCP,35,"In\x20case\x20I\x20forget\x20-\x20user:pass\nubuntu:D
SF:afdas!!/str0ng\n\n")%r(DNSStatusRequestTCP,35,"In\x20case\x20I\x20forge
SF:t\x20-\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n")%r(Help,35,"In\x20case
SF:\x20I\x20forget\x20-\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n")%r(SSLSe
SF:ssionReq,35,"In\x20case\x20I\x20forget\x20-\x20user:pass\nubuntu:Dafdas
SF:!!/str0ng\n\n")%r(TerminalServerCookie,35,"In\x20case\x20I\x20forget\x2
SF:0-\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n")%r(TLSSessionReq,35,"In\x2
SF:0case\x20I\x20forget\x20-\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n")%r(
SF:Kerberos,35,"In\x20case\x20I\x20forget\x20-\x20user:pass\nubuntu:Dafdas
SF:!!/str0ng\n\n")%r(SMBProgNeg,35,"In\x20case\x20I\x20forget\x20-\x20user
SF::pass\nubuntu:Dafdas!!/str0ng\n\n")%r(X11Probe,35,"In\x20case\x20I\x20f
SF:orget\x20-\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n")%r(FourOhFourReque
SF:st,35,"In\x20case\x20I\x20forget\x20-\x20user:pass\nubuntu:Dafdas!!/str
SF:0ng\n\n")%r(LPDString,35,"In\x20case\x20I\x20forget\x20-\x20user:pass\n
SF:ubuntu:Dafdas!!/str0ng\n\n")%r(LDAPSearchReq,35,"In\x20case\x20I\x20for
SF:get\x20-\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n")%r(LDAPBindReq,35,"I
SF:n\x20case\x20I\x20forget\x20-\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n"
SF:)%r(LANDesk-RC,35,"In\x20case\x20I\x20forget\x20-\x20user:pass\nubuntu:
SF:Dafdas!!/str0ng\n\n")%r(TerminalServer,35,"In\x20case\x20I\x20forget\x2
SF:0-\x20user:pass\nubuntu:Dafdas!!/str0ng\n\n");
MAC Address: 16:FF:F5:9C:09:89 (Unknown)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 0.79 seconds
```
---

From the output, it is clear that ports 22, 2222, and 31337 are open. However, when I tried those ports, they did not return useful information.
---
While reading the nmap output, I noticed this string:
```text
user:pass\nubuntu:Dafdas!!/str0ng\n\n
```
That caught my attention — Dafdas!!/str0ng might be the password for the user pass.
---
I tried connecting via SSH using that password, but it did not work at first. Then I realized the user:pass mapping meant the username is ubuntu and the password is Dafdas!!/str0ng. I then connected with:
```bash
ssh ubuntu@10.201.77.239
```
Eventually, I got into the machine and listed the directory with:
```bash
ls -al
```
The output showed:
```text
drwxr-xr-x 1 ubuntu ubuntu 4096 Oct  2 02:48 .
drwxr-xr-x 1 root   root   4096 Mar  2  2022 ..
-rw-r--r-- 1 ubuntu ubuntu  220 Feb 25  2020 .bash_logout
-rw-r--r-- 1 ubuntu ubuntu 3771 Feb 25  2020 .bashrc
drwx------ 2 ubuntu ubuntu 4096 Oct  2 02:48 .cache
-rw-r--r-- 1 ubuntu ubuntu  807 Feb 25  2020 .profile
```
In particular, I examined .profile and found the flag of the day:
```text
flag{251f309497a18888dde5222761ea88e4}
```