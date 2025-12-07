## Day 64
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Phishing Prevention**](https://tryhackme.com/room/phishingemails4gkxh)
---
**Sender Policy Framework (SPF)** : is used to authenticate the sender of an email. With SPF record in place, Internet Service Providers can verify that a mail server is authorized to send email for a specific domain. An SPF record is a DNS TXT record containing a list of the IP addresses that are allowed to send email on behalf of our domain.
![alt text](image.png)
When an email is sent, the **receiving mail server checks the domain's SPF record to verify whether the sending server is authorized to send messages** on behalf of that domain. The delivery of the email (intended action) is based on the result of the SPF record verification.

Pass, Neutral, None --> Accept
SoftFail, PermError	 --> Flag (Mark as suspicious but allow)
Fail, TempError	--> Reject (Immediately discard the email)

```bash
v=spf1 ip4:127.0.0.1 include:_spf.google.com -all
```
- v=spf1 Signifies the start of the SPF record
- ip4:127.0.0.1 Specifies which IP can send mail (IPv4 in this case)
- include:_spf.google.com Specifies which domain can send mail
- -all Non-authorized emails will be rejected


