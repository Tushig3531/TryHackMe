# Day 8
---

## **Room:** [TakeOver](https://tryhackme.com/room/takeover)

> **Prompt**
>
> > Hello there,

> > I am the CEO and one of the co-founders of futurevera.thm. In Futurevera, we believe that the future is in space. We do a lot of space research and write blogs about it. We used to help students with space questions, but we are rebuilding our support.

> > Recently blackhat hackers approached us saying they could takeover and are asking us for a big ransom. Please help us to find what they can takeover.

> >Our website is located at https://futurevera.thm

> >Hint: Don't forget to add the 10.201.78.104 in /etc/hosts for futurevera.thm ; )---
---
### Walkthrough
First I followed the hint and added the host mapping so my machine resolved futurevera.thm to the lab IP:
```bash
sudo nano /etc/hosts
# add
10.201.78.104    futurevera.thm
```
With the name resolving, I did passive/active discovery to look for hidden hosts and subdomains. I used ffuf to fuzz virtual hosts (Host header fuzzing) and discovered support and blog subdomains:
```bash
ffuf -u https://futurevera.thm/ -H 'Host: FUZZ.futurevera.thm'  -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt 
```
Results showed at least support.futurevera.thm and blog.futurevera.thm. I browsed those and started looking for leakage and misconfigurations.
While enumerating the support area I found security issues with the site’s TLS certificate and cookie settings. I also discovered an .mp4 in the security section that didn’t belong there — it had no secrets, but hinted that the next clue was nearby.
Inspecting the certificate showed the site was linked to a different hostname, so I added that hostname to /etc/hosts and visited it. The warning banner on that page revealed the flag of the day. 
```text
flag{beea0d6edfcee06a59b83fb50ae81b2f}
```












