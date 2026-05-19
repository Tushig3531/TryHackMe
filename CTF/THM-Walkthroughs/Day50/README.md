## Day 50
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**SOC L1 Alert Triage**](https://tryhackme.com/room/socl1alerttriage)
[**SOC L1 Alert Reporting**](https://tryhackme.com/room/socl1alertreporting)
---
Through out these rooms, I have understood how the Security Analysts handle the Alerts which is crucial skill for this job position. Even though, I didn't take any note for these rooms, I have understood how can I think like a SOC analysts. 

Before closing or passing the alert to L2, we might have to report it. 
L1 analysts write alert reports serves several key porpuses:
- Provide cibtext for escalation: well-written repor saves lots of time for L2 analysts, it helps them quichly understand hwat happened
- Save findings for the records : Raw SIEM logs are stored for 3-12 months, but alerts are kept indefinitely, Asa reuslt, it is better to heep all the context inside the alert, just in case.
- Improve investigation skills : If we can't explain it simply, we don't understand it well enough. Report writing is a great way to boost L1 skills by summarising alerts.

5 Ws approach and include at least these items in the report:
- Who, What, When, Where, Why
For example:
> > At 13:56 UTC, the user S.Conway (Susan Conway, HR coordinator) accessed the phising website freecatvideoshd[.]monster from their LPT-HR-009 Windows laptop. At 13:58 UTC, the user downloaded a file from there named cats2025.mp4.exe, likely mistaking it for legitimate video.

> > VirusTotal reports confirm that the file is LummaStealer malware, aimed to exfiltrate sensitive data and establish a C2 channel. Further malware actions require deeper investigation, so escaling the alert to L2 and sharing the SIEM findgins:
> > link

We should escalate the alerts if:
- Alert is an indicator of a major cyberattack, requiring deeper investigation or DFIR
- Remediation actions like malware removal, host isolation, or password reset are required
- Communication with customers, partners, management, or law enforcement agencies is required
- We just do not fully understand the alert and need some help from more senior analysts

**Communication Cases**
- We need to escalate an urgent, critical alert, but L2 is unavailable and does not respond for 30 minutes: Ensure we know where to find emergency contancts. First, try to call L2, then L3, and finally the manager
- The alert about Slack/Team account conpromise requires you to validate the login with the affected user: Do not contact the through the breached chat
- We receive an overwhelming number of alerts during a short period of time, some of which are critical : Prioritise the alerts according to the workflow, but inform your L2 on shift about the situation
- After a few days, we realize that we misclassified the alert and likely missed a malicious action : Immediately reach out to L2 explaining the concers. Threat actors can be silent for weeks before impact
- We can not complete the alert trainge since the SIEM logs are not parsed correctly or are not searchable : Do not skip the alert - investigate what we can and report the issue to our L2 on shift or SOC engineer
