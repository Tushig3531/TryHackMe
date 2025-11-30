## Day 59
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Unified Kill Chain**](https://tryhackme.com/room/unifiedkillchain)
---
Unified Kill Chain framework that is used to help understand how cyber attacks occur.

"Kill Chain" is a term used to explain the various stages of an attack. 
---
Threat modelling is a series of steps to ultimately improve the security of a system. Threat modelling is about identifying risk and essentially boils down to:
1. Identifying what systems and applications need to be secured and what function they serve in the environment.
2. Assessing what vulnerabilities and weaknesses these systems and applications may have and how they could be potentially exploited
3. Creating a plan of action to secure these systems and applications from the vulnerabilities highlighted
4. Putting in policies to prevent these vulnerabilites from occurring again where possible 

Threat modelling is an important procedure in reducing the risk withing a system
The unified kill chain can encourage threat modelling as the unified framework helps identify potential attack surfaces and how these systems may be exploited

**STRIDE** (Spoofing, Tampering, Repudiation, Information, Disclosure, DoS, and Evelation of Privilege), **DREAD** (a system used by microsoft to assess risk to computer security threats), and **CVSS** (Common Vulnerability Scoring System) are all frameworks specifically used in threat modelling. 
---
The UKS states that there are 18 phases to an attack. 
![alt text](image.png)

# +---------------------------------------------------------------+--------------------------------------------------------------------------+
# | Benefits of the Unified Kill Chain (UKC) Framework            | How do Other Frameworks Compare?                                         |
# +---------------------------------------------------------------+--------------------------------------------------------------------------+
# | Modern (released in 2017, updated in 2022).                   | Some frameworks, such as MITRE’s, were released in 2013, when the       |
# |                                                               | cybersecurity landscape was very different.                              |
# +---------------------------------------------------------------+--------------------------------------------------------------------------+
# | Extremely detailed (18 phases).                               | Other frameworks often have only a small handful of phases.             |
# +---------------------------------------------------------------+--------------------------------------------------------------------------+
# | Covers an entire attack: reconnaissance, exploitation,        | Other frameworks cover only a limited number of phases in the           |
# | post-exploitation, and even the attacker’s motivation.        | attack lifecycle.                                                        |
# +---------------------------------------------------------------+--------------------------------------------------------------------------+
# | Highlights realistic attack behavior where stages often       | Other frameworks generally do not account for attackers moving back     |
# | re-occur (e.g., after exploiting a machine, an attacker       | and forth between different phases during an attack.                    |
# | performs new reconnaissance to pivot to another system).      |                                                                          |
# +---------------------------------------------------------------+--------------------------------------------------------------------------+

.
---
Source [**MITRE**](https://attack.mitre.org/)
**Phase: In (Initial Foothold)**
- Reconnaissance [**MITRE Tactic TA0043**](https://attack.mitre.org/tactics/TA0043/)
- Weaponization [**MITRE Tactic TA0001**](https://attack.mitre.org/tactics/TA0001/)
- Social Engineering [**MITRE Tactic TA0001**](https://attack.mitre.org/tactics/TA0001/)
- Exploitation [**MITRE Tactic TA0002**](https://attack.mitre.org/tactics/TA0002/)
- Persistence [**MITRE Tactic TA0003**](https://attack.mitre.org/tactics/TA0003/)
- Defence Evasion [**MITRE Tactic TA0005**](https://attack.mitre.org/tactics/TA0005/)
- Command & Control [**MITRE Tactic TA0011**](https://attack.mitre.org/tactics/TA0011/)
- Pivoting [**MITRE Tactic TA0008**](https://attack.mitre.org/tactics/TA0008/)
**Phase: Through (Network Propagation)**
- Pivoting [**MITRE Tactic TA0008**](https://attack.mitre.org/tactics/TA0008/)
- Discovery [**MITRE Tactic TA0007**](https://attack.mitre.org/tactics/TA0007/)
- Privilege Escalation [**MITRE Tactic TA0004**](https://attack.mitre.org/tactics/TA0004/)
- Execution [**MITRE Tactic TA0002**](https://attack.mitre.org/tactics/TA0002/)
- Credential Access [**MITRE Tactic TA0006**](https://attack.mitre.org/tactics/TA0006/)
- Lateral Movement [**MITRE Tactic TA0008**](https://attack.mitre.org/tactics/TA0008/)
**Phase: Out (Action on Objectives)**
- Collection [**MITRE Tactic TA0009**](https://attack.mitre.org/tactics/TA0009/)
- Exfiltration [**MITRE Tactic TA0010**](https://attack.mitre.org/tactics/TA0010/)
- Impact [**MITRE Tactic TA0040**](https://attack.mitre.org/tactics/TA0040/)
- Objectives







