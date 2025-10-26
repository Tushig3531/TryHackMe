## Day 32
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Web Application Basics**](https://tryhackme.com/room/webapplicationbasics)
---

Method:
- GET : Avoid putting sensitive info in GET requests
- POST : Always validate and clean the input to avoid attacks like SQL injection or XSS.
- PUT : Make sure the user is authorised to make changes before accepting the request
- PATCH : Updates part of a resource. It is useful for making small changes without replacing the whole thing, but always validate the data to avoid inconsistencies
- HEAD : Works like GET but only retrieves headers, not the full content. It is handy for checking metadata without downloading the full response
- OPTIONS : Tell us what methods are available for a specific resource
- TRACE : Similar to OPTIONS, it shows which methods are allowed

HTTP Version:

- HTTP/0.9 (1991) : The first version, only supported GET requests
- HTTP/1.0 (1996) : Added headers and better support for different types of content, improving caching
- HTTP/1.1 (1997) : Brought persistent connections, chunked transfer encoding, and better caching. It's still widely used today
- HTTP/2 (2015) : Introduced features like multiplexing, header compression, and prioritisation for faster performance.
- HTTP/3 (2022) : Built on HTTP/2, but uses a new protocol (QUIC) for quicker and more secure connections.

Status Codes:
- Informational Responses (100-199) : These codes mean the server has received part of the request and it waiting for the rest. 
- Successful Responses (200-299) : Everything worked as expected. The Server processed the request and sent back the requested data
- Redirection Message (300-399) : Resource we requested has moved to different location
- Client Error Responses (400-499) : Code indicate the problem with the request
- Server Error Responses (500-599) : Server encountered an error while trying to fulfil the request

**Security Headers** 
Improving security of the web application by providing mitigation against attacks like Criss-Site Scripting (XSS), clickjacking, and others. 

Content-Security-Ploicy (CSP)
A CSP header is an additional security layer that can help mitigate against common attacks like XSS. Malicious codecould be hosted on a separate website or domain and injected into thevulnerable website. 
A CSP provides a way for administrators to say what domains or sources are considered safe and provides a layer of mitifation to such attack. 

Content-Security-Policy: default-src 'self'; script-src 'self httpL//tushige.com; style-src 'self'
- default-src : specifies the default plicy of self, which means only the current website
- script-src : specifies the policy for where scripts can be loaded from
- style-src : specifies the plicy for where style CSS style shees can be loaded from the corrent website

Strict-Transport-Security (HTST):
The HSTS header ensures that web browsers will always connect over HTTPS.
"String-Transport-Security: max-age=63072000; includeSubDomains; preload"
- max-age : expiry time in seconds for this settings
- includeSubDomians : instucts the browser to also apply this setting to all subdomains
- preload : allows the website to be included in preload lists. Browsers can use preload lists to enforce HSTS before even having their first visit to a website

X-Content-Type-Options:
Used to instruct browsers not to guess the MIME(Multipurpose Internet Mail Extensions) time of a resource but only use the Content-Type header: Example
"X-Content-Type-Options: nosniff"
- nosniff : This dierective instructs the browser not to sniff or guess the MIME type

Referrer Policy:
Controls the amount of information sent to the destination web server when a user is redirected from the source web server. The header is available to allow a web administrator to control what information is shared

- no-referrer : This completely disables any information being sent about the referrer

- same-origin : This policy will only send referrer information when the destination is part of the same origin. 

- strict-origin : This policy only sends the referrer as the origin when the protocol stays the same. So, a referrer is sent when an HTTPS connection goes to another HTTPS connection.

- strict-origin-when-cross-origin : This is similar to strict-origin except for same-origin requests, where it sends the full URL path in the origin header.

