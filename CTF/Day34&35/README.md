## Day 34 & 35
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**OWASP Top 10 - 2021**](https://tryhackme.com/room/owasptop102021)
---

Cryptographic failures often involves techniques like "Main in the Middle Attacks"

Injection attacks depend on what technologies are used and how these tehcnologies interpret the input.
- SQL Injection : occurs when user-controlled input is passed to SQL queries. As a result, the attacker can pass in SQL queries to manipulate the outcome of such queries. Modify and delete information in a database. 
- Command Injection : Occurs when user input is passed to system commands. 
Prevention injection attacks is ensuring that user-controlled input is not interpreted as queries or commands.
- Using an allow list : when input is sent to the server, this input is compared to a list of safe inputs or characters
- Stripping input


Insecure Design refers to vulnerabilities which are inherent to the application's architecture. 

Security misconfigurations includes:
- Poorly configured permissions on cloud service, like S3 buckets
- Having unnecessary features enabled
- Default acconts with unchanged passwords
- Error messages that are overly detailed and allow attackers to find ot more about the system
- Not using HTTP security headers


JWTs are very simple tokens that allow us to store key-value pairs on a token that provides integrity as part of the token. The idea is that we can generate tokens that we can give our users with the certainty that they won't be able to alter the key-value pairs and pass the integrity check.


Server-Side Request Forgery:
Occurs when attacker can coerce a web application into sending requests on their behalf on their behalf to arbitaty destinations while having of the contents of the request itself. SSRF often arise from implementations where our web application needs to use third-party services. 