## Day 2:

Today's room was the hardest CTF flag capture I have attempted so far.  
I worked on this room for about **5 hours** and finally managed to capture **two flags**.  
---
## Room: [Lookup](https://tryhackme.com/room/lookup)
---
## Room Prompt
> *"Lookup offers a treasure trove of learning opportunities for aspiring hackers. This intriguing machine showcases various real-world vulnerabilities, ranging from web application weaknesses to privilege escalation techniques. By exploring and exploiting these vulnerabilities, hackers can sharpen their skills and gain invaluable experience in ethical hacking. Through "Lookup," hackers can master the art of reconnaissance, scanning, and enumeration to uncover hidden services and subdomains. They will learn how to exploit web application vulnerabilities, such as command injection, and understand the significance of secure coding practices. The machine also challenges hackers to automate tasks, demonstrating the power of scripting in penetration testing.﻿"*
---

##  What I Learned

- How to use **Hydra** for brute-forcing passwords with known usernames.  
- How the **`ls -al`** command reveals permissions, ownership, and file links.  
- How to search for and exploit vulnerabilities in software like **elFinder**.  
- How to use **Metasploit (msf)** by setting `RHOST` and `LHOST` to get a reverse shell.  
- How to escalate privileges by manipulating file paths and IDs.  
- How to pivot from system errors (failed `id` commands, missing files) into an attack strategy.  
- How to tune Hydra with different **task counts (-t 2000, 4000, 6000)** to balance speed and stability.  
---

## Process of Finding the Flags

1. **Initial User Discovery with Python & Hydra**  
   - Wrote a Python script to enumerate valid usernames by checking server responses:

     ```python
     import requests
     import multiprocessing

     target = "http://lookup.thm/login.php"
     wordlist = '/usr/share/wordlists/SecLists/Usernames/Names/common.txt'

     def user_check(name, target):
         data = {'username': name, 'password': 'password'}
         response = requests.post(target, data=data)
         if "Wrong password" in response.text:
             print(f"User found: {name}")

     try:
         with open(wordlist, 'r') as f:
             users = f.readlines()
         for user in users:
             user = user.strip()
             multiprocessing.Process(target=user_check, args=(user, target)).start()
     except FileNotFoundError:
         print(f'error: wordlist file not found')
     ```

   - This revealed two valid users: **`admin`** and **`jose`**.  
   - Leveraged the bug that displayed different error messages for wrong username vs wrong password.  
   - Used **Hydra** to brute-force each user’s password successfully.  
   - After logging in, discovered that the service was using **elFinder** as a web file manager on `files.lookup.thm`.

2. **Exploiting elFinder**  
   - The I did small research on elFinder and found the possible way to find the exploit on the system
   - Then, used **Metasploit Framework (msf)**, setting `RHOST` to `files.lookup.thm` and `LHOST` to my IP.  
   - Ran the elFinder exploit and obtained a reverse shell.  
   - Eventually, I managed to get into the system

3. **Metasploit Enumeration**  
   - With msf, enumerated the list of users and their files. But most of them was not readble
   - But I found unusual entries under `/sbin` for the `think` user, which hinted at exploitation potential.  
   - In the sbin, it stated these encountered errors:  
     - `Error executing id command`  
     - `Error reading username from id command`  
     - `File /home/%s/.passwords not found`  
   - These revealed that the system was expecting a valid ID input, which gave me a pivoting path into `think`.

4. **User Manipulation & Privilege Escalation**  
   - Initially we didn't have the `think` user’s password.  
   - Then through the error stated in sbin and found the way to pretend to be 'think' by manipulating file paths and echoed my own ID into the system, which allowed me to pivot into the `think` account.  

5. **Password Discovery (Second Phase)**  
   - Since I am in the system of 'think' I managed to get all the files in his bin and located a password list on the system
   - Used Hydra again with the `think` username to brute-force the correct password.  
   - While navigating through his files, I have found the file named 'user.txt'
   - Captured the **first flag**.  

6. **Rooting & Final Flag**  
   - From the `think` account, used `ls -al` to examine file permissions.  
   - Found a path leading to `/usr/bin/look`, which I leveraged to escalate privileges.  
   - Successfully rooted the system and captured the **second flag**.  

---

##  Summary
This challenge was difficult but rewarding.  
I chained together Python scripting, Hydra brute-forcing, Metasploit exploitation, file permission analysis, and privilege escalation.  
This experience strengthened my ability to combine tools and logic into a complete attack path for capturing all flags.
