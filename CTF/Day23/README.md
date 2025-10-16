## Day 23
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Networking Secure Protocols**](https://tryhackme.com/room/networkingsecureprotocols)
---
**TLS**
TLS is a cryptographic protocol operating at the OSI model's transport layer. It allows secure communication between a client and a server over an insecure network. 
- TLS ensures that no one can read or modify the exchanged data.
- Protocols have received security upgrades with a simple addition of TLS. 
  - HTTP becomes HTTPS
  - DNS becomes DoT (DNS over TLS)
  - MQTTS
  - SIPTS

**HTTPS**

A web browser requests a page over HTTP. After resolving the domain name to an IP address, the client will carry out the following two steps:
1) Establish a TCP three-way handshake with the target server
2) Communicate using the HTTP protocol, such as GET / HTTP/1.1

**HTTP Over TLS**
Requesting a page over HTTPS requires the following three steps:
- Establish a TCP three-way handshake with the target server
- Establish a TLS session
- Communicate using the HTTP protocol

The key takeaway is that TLS offers security for HTTP without requiring any changes in the lower or higher layer protocols. In other words, TCP and IP were not modified, while HTTP was sent over TLS the same way it would be sent over TCP.

**SMTPS, POP3S, and IMAPS**
Adding TLS to SMTP, POP3, and IMAP is similar to adding TLS to HTTP. 

**Default Ports:**
- HTTP → 80  
- SMTP → 25  
- POP3 → 110  
- IMAP → 143  

**TLS (Secure) Ports:**
- HTTPS → 443  
- SMTPS → 465 and 587  
- POP3S → 995  
- IMAPS → 993  

**SSH**

OpenSSH offers:
- Secure authentication: Besides password-based authentication, SSH supports public key and two-factor authentication.
- Confidentiality: OpenSSH provides end-to-end encryption, protecting against eavesdropping. Furthermore, it notifies you of new server keys to protect against man-in-the-middle attacks.
- Integrity: In addition to protecting the confidentiality of the exchanged data, cryptography also protects the integrity of the traffic.
- Tunneling: SSH can create a secure "tunnel" to route other protocols through SSH. This setup leads to a VPN-like connection.
- X11 Forwarding: If we connect to a Unix-like system with a graphical user interface, SSH allows you to use graphical applications over the network.

"-X" is required to support running graphical interfaces, for example:  
`ssh ***.***.***.*** -X`

**SFTP and FTPS**
SFTP stands for SSH File Transfer Protocol and allows secure file transfer.  
FTPS stands for File Transfer Protocol Secure. It requires certificate setup and can be tricky to allow over strict firewalls, as it uses separate connections for control and data transfer.
