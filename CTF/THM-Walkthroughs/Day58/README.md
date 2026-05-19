## Day 58
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Cyber Kill Chain**](https://tryhackme.com/room/cyberkillchainzmt)
---
The Cyber Kill Chain framework is designed for identification and prevention of the network intrusions. 

The Cyber Kill Chain will help us understand and protect against ransomware attacks, security breaches as well as Advanced Persistent Threats (APTs). We can use the Cyber Kill Chain to assess our network and system security by identifying missing security controls and closing certain security gaps based on our company's infrastructure.

So we will be able to recognize the intrusion attempts and understand the intruder's goals and objectives.
---
7 Common Phases:
- 1) Reconnaissance : Attacker gathers information about the target
- 2) Weaponization : They create or prepare their attack tools (malware, exploit, payload, etc)
- 3) Delivery : They send the malicious thing to the victim 
- 4) Exploitation : The malicious code actually runs/exploits a vulnerabilty
- 5) Installation : They install malware or a backdoor on the system
- 6) Command & Control (C2) : The compromised machine connects back to the attacker's server so they can control it
- 7) Actions on Objectives : They do what they came for: steal data, encrypt files, spy, destroy, etc
.
---
### Reconnaissance
- A valuable piece of recon is OSINT (Open Source Intelligence). With OSINT, adversaries gather insights about their target through publicly available information. 

**Reconnaissance Types**
- Passive Recon : This involves having no direct interaction with the target. This may include WHOIS lookups, social media scraping, or reviewing breach data 
- Active Recon : This involves direct contact with the taget with activities such as social engineerin, port scanning, banner grabbing, or probing for open services

**Email harvesting** is the process of obtaining email addresses from public, paid, or free services. An attacker can use email-address harvesting for a phishing attack.
.
---
### Weaponization
Attackers usually use automated tools to generate the malware or refer to the DarkWeb to purchase the malware. More sophisticated actors or nation-sponsored APT (Advanced Persistent Threat Groups) would write their custom malware to make the malware sample unique and evade detection on the target.
.
---
### Delivery
- Phishing email
- USB drops
- Watering hole attacks : tergeted and designed to aim at a specific group of people by compromising the website they are usually visiting, redirecting them to a malicious website of the attacker's choice or creation. Victims would unintentionally download malware or a malicious application to their computer, resulting in a drive-by download
.
---
### Exploitation
- Malicious macro execution : delivered through phishing email, that would execute ransomware when the victim opens it
- Zero-day exploits : These leverages on unknown and unpatched flaws in a system. These exploits haveno opportunity for detection at the beginning
- Known CVEs
Signs of exploitation to look out for include:
- Unexpected process spawns
- Registry changes or new services created
- Suspicious command-line arguments found in system logs
.
---
### Installation
A persistent backdoor will let the attacker access the system he compromised in the past. 
The persistence can be achieved through:
- Installing a web shell on the webserver
- Installing a backdoor on the victim's machine
- Creating or modifying Windows services
- Adding the entry to the "run keys" for the malicious payload in the Registry or the Startup Folder.
---
### Command & Control (C2)
**C&C or C2 Beaconing** : Opens up the C2 channel through the malware to remotely control and manipulate the victim.
Through the connection, the attacker has full control of the victim's machine.
Most common C2 channels used by adversaries include:
- HTTP on port 80 and HTTPS on port 443, where this type of beaconing blends the malicious traffic with the legitimate traffic and can help the attacker evade firewalls
- DNS, where the infected machine makes constant DNS requests to the DNS server that belongs to an attacker, this type of C2 communication is also known as DNS Tunneling





