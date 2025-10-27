## Day 33
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**JavaScript Essentials**](https://tryhackme.com/room/javascriptessentials)
[**SQL Fundamentals**](https://tryhackme.com/room/sqlfundamentals)
[**Burp Suite : The Basics**](https://tryhackme.com/room/burpsuitebasics)
---
Burp Suite is a Java-based framework designed to server as a comprehensive solution for conductiong web application penetration testing. 
- This is the standart tool for hands-on security assessments of web and mobile applications
- Burp Suite captures and enables manipulation of all the HTTP/HTTPS traffic between a browser and a web server.
- The ability to intercept, view, and modify web requests before they reach the target server or even manipulate responses before they are received by our browser
- invaluable tool for manual web application testing

1) **Burp Suite Professional** is an unrestricted version of Burp Suite Comminity. Features:
- An automated vulnerablity scanner
- A fuzzer/brute-forcer that isn't rate limited
- Saving projects for future use and report generation
- A built-in API to allow integration with other tools
- Unrestricted access to add new extensions for greater functionality
- Access to the Burp Suite Collaborator (providing a unique request catcher self-hosted or running on a Portswigger-owned server)
2) **Burp Suite Enterprise**, is primarily utilized for continuous scanning. Feature:
- Automated Scanner that periodically scan
Burp Suite Enterprise resides on a server and constantly scans the target web applications for potential vulnerabilities

Array of tools that are highly valuable for web application testing. Features:
- Proxy : It enables interception and modification of requests and responses while interacting with web applications.
- Repeater : It allows for capturing, modifying , and resending the same request multiple times/ It is useful when crafting payloads through trial and error or testing the fuctionality of an endpoint for vulnerabilities
- Intruder : It allow for spraying endpoints with requests. It is commonly utilized for brute-force attacks or fuzzing endpoints. 
- Decoder : It decode captured informations or encode payloads before sending them to the target. 
- Comparer : it enables the comparison of two pieces of data at either the word or byte level. The ability to send potentially large data segments directly to a comparison tool with a single keyboard shrtcut significantly accelerates the process
- Sequencer : When assessing the randomness of tokens, such as session cookei values or other supposedly randomly generated data. If algorithm used for generating lack secure randomness, it can expose avenues for devastating attacks

Key points to Understand about the Burp Proxy:
- Intercepting Requests: When requests are made, they are intercepted and held back from reaching the target server. Allowing for further actions such as forwarding, dropping, editing, or sending them to other modules. To disable the intercept and allow request, Intercept is on
- Taking Control : The ability to intercept request empowers testers to gain complete control over web traffic
- Capture and Logging : Captures and logs requests made through the proxy by default. 
- WebSocket Support : captures and logs websocket communication










