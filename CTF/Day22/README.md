## Day 22
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Networking Core Protocols**](https://tryhackme.com/room/networkingcoreprotocols)
---

**DNS: Remembering Addresses**

The **Domain Name System (DNS)** is responsible for properly mapping a domain name to an IP address.  
DNS operates at the Application Layer (Layer 7) of the OSI model. DNS traffic uses **UDP (User Datagram Protocol)** port 53 by default and TCP (Transmission Control Protocol) port 53 as a fallback.

- **A Record** – Maps a hostname to one or more IPv4 addresses.  
  Example: *tushige.com* → *x.xx.x.xxx*
- **AAAA Record** – Similar to an A record but used for IPv6.
- **AA and AAA** should refer to battery sizes; moreover, **AAA** can also mean *Authentication, Authorization, and Accounting* — neither applies to DNS.
- **CNAME Record** – Maps one domain name to another.  
  Example: *www.tushige.com* → *tushig.com* or *tushige.org*
- **MX Record** – Specifies the mail server responsible for handling emails for a domain.

For example, when I type tushige.com, my browser queries the DNS server for the A record. However, when sending an email to tushige@gmail.com, the mail server queries the DNS for the MX record.  
Using the `nslookup` command, we can view the IP address of a domain.

---

**WHOIS**

We can look up the WHOIS record of a registered domain name using an online service or the Linux command-line tool `whois`.  
A WHOIS record provides information about the entity that registered the domain, including the name, phone number, email, and address.

---

**HTTP(S): Accessing the Web**

HTTP stands for *Hypertext Transfer Protocol*; the **S** in HTTPS stands for *Secure*.  
- **GET** – Retrieves data from a server (e.g., HTML file or image).  
- **POST** – Submits new data to the server (e.g., form submission or file upload).  
- **PUT** – Creates or updates a resource on the server.  
- **DELETE** – Deletes a specified file or resource.

HTTP and HTTPS commonly use **TCP ports 80 and 443**, respectively, though sometimes **8080** and **8443** are also used.

---

**FTP: Transferring Files**

**File Transfer Protocol (FTP)** is designed for efficient file transfers. Under equal conditions, FTP can achieve higher speeds than HTTP.

- **USER** – Input username  
- **PASS** – Enter password  
- **RETR** – Download a file from the FTP server  
- **STOR** – Upload a file to the FTP server  

The FTP server listens on **TCP port 21** by default; data transfer occurs through another client–server connection.

---

**SMTP: Sending Email**

**Simple Mail Transfer Protocol (SMTP)** defines how a mail client communicates with a mail server and how servers exchange emails.

- **HELO/EHLO** – Initiates the SMTP session  
- **MAIL FROM** – Specifies the sender’s address  
- **RCPT TO** – Specifies the recipient’s address  
- **DATA** – Begins sending the content of the email  
- **.** – Indicates the end of the message (a single period on its own line)

---

**POP3: Receiving Email**

**Post Office Protocol version 3 (POP3)** allows a client to retrieve emails from a mail server.

- **USER <username>**  
- **PASS <password>**  
- **STAT** – Requests number and total size of messages  
- **LIST** – Lists messages  
- **RETR <message_number>** – Retrieves a message  
- **DELE <message_number>** – Deletes a message  
- **QUIT** – Ends the session

---

**IMAP: Synchronizing Email**

**IMAP (Internet Message Access Protocol)** allows synchronization of read, moved, and deleted messages across multiple clients.  
Unlike POP3, which downloads and deletes mail from the server to minimize storage, IMAP retains mail on the server to ensure consistency across devices.

- **LOGIN <username> <password>**  
- **SELECT <mailbox>**  
- **FETCH <mail_number> <data_item_name>**  
- **MOVE <sequence_set> <mailbox>**  
- **COPY <sequence_set> <data_item_name>**  
- **LOGOUT**

---

**List of Common Protocols**

| Protocol | Transport Protocol | Default Port |
|-----------|--------------------|---------------|
| TELNET    | TCP                | 23            |
| DNS       | UDP or TCP         | 53            |
| HTTP      | TCP                | 80            |
| HTTPS     | TCP                | 443           |
| FTP       | TCP                | 21            |
| SMTP      | TCP                | 25            |
| POP3      | TCP                | 110           |
| IMAP      | TCP                | 143           |
