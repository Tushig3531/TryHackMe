.
## Day 39
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**SOC Fundamentals**](https://tryhackme.com/room/socfundamentals)
---

- SOC Analyst (level 1) : Anything detected by the security solution would pass through these analysts first. These are the first responders to any detection. SOC level 1 Analysits perform basic alert triage to determine if a specific detextion is harmful. They also reprt these detections through proper channels
- SOC Analyst (level 2) : While Level 1 does the first-level analysis, some detections may require deeper investigation. Leve 2 Analysits help them dive deeper into the inverstigations and correlate the data from multibple data sources to perform a proper analysis
- SOC Analyst (level 3) : Level 3 Analysts are experienced professionals who proactivelt look for any threat indicators and support in the incident response activities. The critical severity detection reported by Level 1 and Level 2 Analysts are often security incidents that need detailed responses, including contaiment, eradication, and recovery. This is where Level 3 analysts' experience comes in handy
- Security Engineer : All analysts work on security solutions. These solutions need deployment and configuration. 
- Detection Engineer : Security rules are the logic built behind security solutions to detect harmful activities. Level 2 and 3 Analysts often create these rules, while the SOC team sometimes also utilize the detection engineer role independently for these responsiblity
- SOC Manager : The SOC Manager manages the processes the SOC team foolows and provides support. The SOC Manager also remains in contact with the proganization's CISO (Chief Information Security Officer) to privde updates on the SOC team's current posture 

**Alert Triage**

5Ws : What? When? Where? Who? Why?

Reporting : Alers need to be escalated to higher-level anallysts for a timely response and resolution. These alers are escalated as tickets and assigned to the relevant people. 
The report should discuss all the 5 Ws along with a through analysis and screenshots should be used as evidence of the activity

The forensic activity aims to determine the incident's root cause by analyzing the arifacts from a system or network.

Modern SIEM provide detection analysis based on user's behavior analytics and threat intelligence capability. 
**The SIEM solution only provides the Detection capabilities in a SOC environment**
- EDR : Endpoint Detection and Response (EDR) provides detailed real-time and historical visibility of the devices activities. 
- Firewall : Acts as barrier betwwen my internal and external network. It monitors incoming and outgoing network traffic and filters any unauthorized traffic



