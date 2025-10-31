
## Day 36
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Hydra**](https://tryhackme.com/room/hydra)
[**Gobuster: The Basics**](https://tryhackme.com/room/gobusterthebasics)
---
###Hydra###
Hydra can run though a list and "brute force" some authentication services. We use Hydra to run through a password list and speed this process up for us, determining the correct password

- "-l" : the username for login
- "-P" : the password list to use
- "http-post-form" : the type of the form is POST
- "<path>" : the login page URL
- "<login_credentials>" : the username and password used to login, username=^USER^&password=^PASS^
- "<invalid_response>" : part of the response when the login fails
- "-V" : verbose output for every attempt

hydra -l <username> -P <wordlist> IP:Machine http-post-form "/:username=^USER^&^PASS^:F=incorrect" -V
hydra -l <username> -P <wordlist> IP:Machine ssh "/:username=^USER^&^PASS^:F=incorrect" -V


###Gobuster###
Gobuster enumerates web directories, DNS subdomains, vhosts, Amazon S3 buckets, and Google Cloud Storage by brute force, using wordlists and handling the incoming responses. 

- "-t" : "--threads" : Configures the number of threads to use for the scan. Each of these threads sends out request with a slight delay. 
- "-w" : "--wordlist" 
 - "--delay" : Defines the amount of time to wait between sending requests. Web servers include mechanis,s to detect enumeration by looking at how many requests are recieved in a certain period of time. So by using this we can look like normal
 - "--debug" : Helps us to trouleshoot when our command gives unexpected error
 - "-o" : "--output" : Writes the enumeration result to file we choose
 
 **dir**
 - "-c" : "--cookies" : Configures a cookie to pass along each request, such as a session ID
 - "-x" : "--extensions" : Specifies which file extensions we want to scan for, example, php, js ...
 - "-H" : "--headers" : Configures an entire header to pass along with each request
 - "-k" : "--no-tls-validation" : Skips the process that checks the certificate when https is used. 
 - "-n" : "--no-status" : Use when we don't want to see the status code of each response received
 - "-P" : "password" 
 - "-s" : "--status-codes" : Configure which status codes of the received responses we want to display
 - "-b" : "--status-codes-blacklist" : Configure which status codes of the recieved responses we don't want to display
 - "-U" : "username"
 - "-r" : "--followredirect" : Configures Gobuster to follow the redirect that it received as response to the sent request 
 
 gobuster dir -u http://www.offensivetools.thm/secret -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -x js

**dns**
Checks sub domains
- "-c" : "--show-cname" : Show CNAME Records
- "-i" : "--show-ips": Includingthis flag shows IP addresses that the domain and subdomains resolve to
- "-r" : "--resolver" : Configures a custom DNS server to use for resolving
- "-d" : "--domain" : Configures the domain we want to enumerate

gobuster dns -d offensivetools.thm -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-110000.txt 

**vhosts**
Brute force virtual hosts
Virtual hosts are IP-based and are runningon the same server. 
- vhost mode will navigate to the URL created by combining the configured HOSTNAME with an entry of a wodlist
- dns mode will do a DNS lookup to the FQDN created by combining the configured domain name with an entry of a wordlist

- "-m" : "--method" : Specifies the HTTP method to use for the requests (GET, POST)
- "--append-domain" : Appends the base domain to each word in the wordlist (word.example.com)
- "--domain" : Appends a domain to each wordlist entry to form a valid hostname
- "--exclude-length" : Excludes results based on the length of the response body
- "-r" : "--follow-redirect" : Follows HTTP redirect

gobuster vhost -u http://www.offensivetools.thm --domain offensivetools.thm  -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt --append-domain --exclude-length 250-320


