# Day 7

Today I have completed two rooms: **Corridor** and **Compiled**
---

## **Room:** [Corridor](https://tryhackme.com/room/corridor)

> **Prompt**
>
> > You have found yourself in a strange corridor. Can you find your way back to where you came?  
> > In this challenge, you will explore potential IDOR vulnerabilities. Examine the URL endpoints you access as you navigate the website and note the hexadecimal values you find (they look an awful lot like a hash, don't they?). This could help you uncover website locations you were not expected to access.

---

### Walkthrough

> We started with the host: `10.201.2.149`.

**Initial enumeration**
```bash
# basic HTTP/port check
nmap -sC -sV 10.201.2.149
```
Findings:
- "Only port 80 (HTTP) was open."
Then I tried gobuster to see if there any hidden directory:
```bash
gobuster dir -u http://10.201.2.149 -w /usr/share/wordlists/dirbuster/directory-2.3-medium.txt
```
Result: no useful directories discovered.
---
While browsing the site, I realized the door's endpoints containing hexadecimal-looking values. I collected those hex values and analyzed them. And those were MD5 hash digest:
Decrypted MD5 hashes (MD5 → plaintext):
```lua
c4ca4238a0b923820dcc509a6f75849b  -->  1
c81e728d9d4c2f636f067f89cc14862c  -->  2
eccbc87e4b5ce2fe28308fd9f2a7baf3  -->  3
a87ff679a2f3e71d9181a67b7542122c  -->  4
e4da3b7fbbce2345d7772b0674a318d5  -->  5
1679091c5a880faf6fb5e6087eb1b2dc  -->  6
8f14e45fceea167a5a36dedd4bea2543  -->  7
c9f0f895fb98ab9159f51fd0297e236d  -->  8
45c48cce2e2d7fbdea1afc51c7c6ad26  -->  9
d3d9446802a44259755d38e6d163e820  --> 10
6512bd43d9caa6e02c990b0a82652dca  --> 11
c20ad4d76fe97759aa27a0c99bff6710  --> 12
c51ce410c124a10e0db5e4b97fc2af39  --> 13
```
I noticed the site had entries for hashes representing 1..13. I tried generating the MD5 for 0, probing the corresponding endpoint, and discovered the hidden page containing the flag.
**Result**
Flag discovered by enumerating hash-based endpoints, decoding MD5 values to integers, and probing the 0 entry.
---

## **Room:** [Compiled](https://tryhackme.com/room/compiled)
> **Prompt**
>
> > Download the task file and get started. The binary can also be found in the AttackBox inside the /root/Rooms/Compiled/ directory.
> >Note: The binary will not execute if using the AttackBox. However, you can still solve the challenge.
---
**Walkthrough**
A compiled binary file was provided in the room.
So, I analyzed the file:
```bash 
strings <binary-name>
```
And realized the file is actually containing the information. So I moved the file into text to see more clear:
```bash
mv <binary-name> <binary-name>.txt
```
The strings output contained a line that looked like a password but included embedded nulls / formatting artifacts:
```makefile
Password: �DoYouEven%sCTF�__dso_handle�_init�
```
The surrounding binary symbols and null bytes indicated the true password string was embedded with extra characters. By cleaning and testing likely candidates, I determined the intended usable password.
**Result**
```nginx
DoYouEven_init
```
