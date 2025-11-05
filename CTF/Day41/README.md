.
## Day 41
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Incident Response Fundamentals**](https://tryhackme.com/room/incidentresponsefundamentals)
[**Logs Fundamentals**](https://tryhackme.com/room/logsfundamentals)

---
**Incident Response**
- False positive: A security solution raised an alert on a high amount of data being transferred from one system to an external IP address. Upon analyzing this alert, the security team found that the subject system was undergoing a backup process to a cloud storage service, which caused this. This is known as a false positive.

- True Positive: A security solution raised an alert on a phishing attempt on one of the organization’s users. Upon analyzing this alert, the security team found that the email was a phishing email sent to this user to compromise the system. This is known as a true positive.

True alerts are sometimes referred to as Incidents.

SANS Incident response : Preparation, Identification, Containment, Eradication, Recovery, Lessons Learned : PICERL
NIST : Preparation, Detection and Analysis, Containment Eradication Recovery, Post-Incident Activity

---
**Logs Fundamentals**

- System Logs : The system logs can be helpful in troubleshooting running issues in the OS. These logs provide information on various operating system activities : - System Startup and shutdown events, Driver Loading events, System Error events, Hardware events
- Security Logs : The security logs help detect and investigate incidents. : Authentication events, Authorization events, Security Policy changes events, User Account changes events - Abnormal Activity events
- Application Logs : The application logs contain specific events related to the application.
- Audit Logs : The Audit logs provide detailed information on the system changes and user events. These logs are helpful for compliance requirements and can play a vital role in security monitoring as well. : Data Access Events, System Change events, User Activity events, Policy Enforcement events
- Network Logs : Network logs provide information on the network’s outgoing and incoming traffic. : Firewall Logs
- The Access logs provide detailed information about the access to different resources. : API Access Logs

Windows Event Logs IDs:
4624    A user account successfully logged in
4625    A user account failed to login
4634    A user account successfully logged off
4720    A user account was created
4724    An attempt was made to reset an account’s password
4722    A user account was enabled
4725    A user account was disabled
4726    A user account was deleted
 

