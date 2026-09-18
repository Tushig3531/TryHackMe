## Day 5

**Room:** [Infinity Shell](https://tryhackme.com/room/hfb1infinityshell)  

---

##  Prompt

> Cipher’s legion of bots has exploited a known vulnerability in our web application, leaving behind a dangerous web shell implant. Investigate the breach and trace the attacker's footsteps!.

---

## Walkthrough
We started with almost no information—only that it was a web application. The word “trace” tipped me off to check system logs, so I went to /var/log. Since this involved a web app, I focused on Apache and reviewed its logs. Among the files, error.log.1 and other_vhosts_access.log.1 looked suspicious. I didn’t find much in error.log.1, but other_vhosts_access.log.1 clearly showed repeated attempts to break into the application. Some entries contained encoded payloads that caught my eye. After decoding them with Base64, I was able to recover the flag for the day.
