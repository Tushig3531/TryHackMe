## Day 57
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Pyramid Of Pain**](https://tryhackme.com/room/pyramidofpainax)
---
### Hash Values (Trivial)
- Security professionals usually use the hash values to gain insight into a specific alware sample, a malicious file, and as a way to uniquely identify and reference the malicious artifact.
- You've probably read ransomware reports in the past, where security researchers would provide the hashes related to the malicious or suspicious files used at the end of the report.
.
---
### IP Address (Easy)
Fast Flux is a trick used by botnets and malware to evade detection. It works by making a single malicious domain point to many changing IP addresses. The IP addresses rotate rapidly—sometimes every few minutes. This makes it very hard for defenders to block them all.
**Purpose of Fast Flux**
- Hide the real server
- Keep phishing/malware websites online for longer.
- Make law-enforcement takedowns harder.

Basically, IP addresses are easy to block but also easy for attackers to change. But attackers use techniques like Fast Flux to make blocking IPs ineffective.
---
### Domain Name (Simple)
Domain names are slightly harder for attackers to change than IP addresses, but still relatively easy compared to the items higher on the pyramid

**Punycode**
- Attackers use look-alike characters from other alphabets to create fake domains that LOOK legitimate.
- Browsers sometimes hide the punycode version and show the fake one, tricking users.

Attackers Hide Malicious Domains Behind URL Shorteners
---
### Host Artifacts (Annoying)
Host artifacts are the traces or observables that attackers leave on the system, such as registry values, suspicious process execution, attack patterns or IOCs (Indicators of Compromise), files dropped by malicious applications, or anything exclusive to the current threat.
---
### Network Artifacts (Annoying)
A network artifact is any unusual pattern or piece of information found in network traffic that can help identify malicious activity.
Common Example:
**User-Agent strings**
Text sent by a browser or program that tells the server
- device type
- browser name/version
- OS version
- sometimes malware pretending to be a browser
Attackers sometimes use:
- strange user-agents
- custom user-agents
- outdated user-agents
These stand out because they don’t match normal activity in your environment.
**C2 (Command-and-Control) communication**
Patterns used by malware to communicate with its controller, such as:
- repeated beaconing
- odd timing intervals
- encrypted traffic to unusual domains
**URI or URL patterns**

**Why this is important**
They’re harder for attackers to change quickly.
They’re part of the malware’s internal code or behavior.
Changing them often requires modifying malware or rebuilding infrastructure.

**What can we use**
- Network artifacts can be detected in Wireshark PCAPs (file that contains the packet data of a network) by using a network protocol analyzer such as TShark or exploring IDS (Intrusion Detection System) logging from a source such as Snort.
.
---
### Tools (Challenging)
Now we are detecting the attacker’s tools themselves.
**Examples of Attacker Tools**
- Maldocs : Malicious documents with macros
- Backdoors 
- Custom EXEs & DLLs : Actual compiled malware binaries.
- Payloads 

If we detect their tools, they might have to:
- rewrite the malware
- rebuild entire C2 infrastructure
- purchase new tools
- learn a new technique
- abandon the attack

Antivirus signatures, detection rules, and YARA rules can be great weapons for you to use against attackers at this stage.
- Antivirus signatures : Traditional detection
- Detection rules : suspicious behavior
- YARA : detect similar malware families across multiple samples

**Where to Get Samples & Detection Resources**
- MalwareBazaar : Repository for malware samples and hashes.
- Malshare : Another source of raw malware for research.
- SOC Prime Threat Detection Marketplace : great platform, where security professionals share their detection rules for different kinds of threats including the latest CVE's that are being exploited in the wild by adversaries. 

**Fuzzy Hashing (SSDeep)**
fuzzing hash : A technique to compare files based on similarity, not exact matching.
Fuzzy hashing helps you to perform similarity analysis - match two files with minor differences based on the fuzzy hash values. 
SSDeep is a widely-used fuzzy hashing algorithm.

Attackers often try to recompile or slightly modify malware to avoid detection.
Fuzzy hashing defeats that:
- attackers can’t evade detection just by changing a few bytes
- defenders catch entire families of malware
- attackers must make major changes to bypass detection
Basically, by detecting fuzzing hash, attackers no longer can use similar or related malware, they need to find whole different strategy

ssdeep is a program for computing context triggered piecewise hashes (CTPH). Also called fuzzy hashes, CTPH can match inputs that have homologies.
---
### TTPs (Tough)
TTPs stands for Tactics, Techniques & Procedures. This includes the whole MITRE ATT&CK Matrix, which means all the steps taken by an adversary to achieve his goal, **starting from phishing attempts to persistence and data exfiltration.** 

MITRE ATT&CK® is a globally-accessible knowledge base of adversary tactics and techniques based on real-world observations. The ATT&CK knowledge base is used as a foundation for the development of specific threat models and methodologies in the private sector, in government, and in the cybersecurity product and service community.

With the creation of ATT&CK, MITRE is fulfilling its mission to solve problems for a safer world — by bringing communities together to develop more effective cybersecurity. ATT&CK is open and available to any person or organization for use at no charge.

**If we can detect and respond to the TTPs quickly, we leave the adversaries almost no chance to fight back.**

For, example if we could detect a Pass-the-Hash attack using Windows Event Log Monitoring and remediate it, we would be able to find the compromised host very quickly and stop the lateral movement inside your network. At this point, the attacker would have two options:
- Go back, do more research and training, reconfigure their custom tools
- Give up and find another target
Option 2 definitely sounds less time and resource-consuming.


