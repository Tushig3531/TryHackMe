## Day 26
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Nmap: The Basics**](https://tryhackme.com/room/nmap)
---
Nmap (Network Mapper) is a open-srouce tool used for network discovery and security auditing. It also assists in the exloration of network hosts and services,providing information about open ports, operating systems, and other details.


Specifying its targets:
- IP range using "-" : if we want to scan all the IP addresses from 192.168.0.1 to 192.168.0.10, we write 192.168.0.1-10
- IP subnet using "/" : if us want to scan a subnet, we can expres it as 192.168.0.1/24, and this would be equivalent to 192.168.0.0-255

Nmap offersthe -sn opntion, pin scan. 

Because we are scanning the local network, where we are connected via Ethernet or WiFi, we can look up the MAC addresses of the devices. Consequenly, we can figure out the network card vendors, which is beneficial information as it can help us guess the type of target devices

When scanning a direcly connected network, Nmap starts by sending ARP(Address Resolution Protocol) requests. When a device responds to the ARP request, Nmap labels it with "Host is up"

ARP is responsible for finding the MAC address related to a specific IP address

Nmap offers a list scan with the option -sL. This scan only lists the targets to scan without actually scanning them. For example, nmap -sL 192.168.0.1/24 will list the 256 targets that will be scanned. This option helps confirm the targets before running the actual scan.

"-sn" aims to discover live hosts without atthe,pting to discover the services running on them. This scan be helpful if we want to discover the divices on a network without causing much noise. 



**Port Scanning : Who is Listening**

Connect Scan:

The connect scan can be triggered using -sT. It tries to complete the TCP three-wya handshake with every target TCP port. If the TCP port turns out to be open Nmap connects successfully, Nmap will tear down the established connection.

SYN Scan:

SYN scan only executes the first step; it sends a TCP SYN packet. Consequently, the three-way handshake is never completed. The advantage is that this is expected to lead to fewer logs as the connection is never established, and hench, it is considered a relativelyy stealthy scan.   **-sS**

Scanning UDP ports:

UDP does not require establishing a connection and tearing it down afterwards. Furthermore, it is very suitable for real-time commnuication, such as live broadcasts. All these are reason to consider scanning for and discovering services listening on UDP ports.

Nmap offers the option -sU to scan for UDP services. Because UDP is simpler than TCP, we expect the traffic to differ. 

- -F is for Fast mode, which scans the 100 most common ports
- -p[range] allows us to specify a range of ports to scan. For example, -p10-1024 scans from port 10 to port 1024, while -p-25 will scan all the ports between 1 and 25

# -sT      TCP connect scan  — completes the full three-way handshake
# -sS      TCP SYN scan      — sends SYN only (half-open), does not finish handshake
# -sU      UDP scan          — probes UDP ports
# -F       Fast mode         — scans the 100 most common ports
# -p[range] Specify ports   — e.g. -p80,443  or -p1-1024  ; use -p- to scan all ports

OS Detection:

"-O", the OS detection option triggers Nmap to reply on various indicators to make an aducated guss about the target OS. 

Service and Version Detection: 
"-sV" enables version detection. 

# -O    OS detection
# -sV   Service and version detection
# -A    Aggressive scan — OS detection, version detection, script scanning, and traceroute
# -Pn   Treat all hosts as online (skip host discovery); scan hosts that appear to be down


# -T<0-5>            Timing template — 0: paranoid, 1: sneaky, 2: polite, 3: normal, 4: aggressive, 5: insane
# --min-parallelism  Minimum number of parallel probes (e.g., --min-parallelism 10)
# --max-parallelism  Maximum number of parallel probes (e.g., --max-parallelism 50)
# --min-rate         Minimum probe rate (packets/second) (e.g., --min-rate 100)
# --max-rate         Maximum probe rate (packets/second) (e.g., --max-rate 1000)
# --host-timeout     Maximum time to wait for a target host (accepts time units, e.g., --host-timeout 30s)

the -v option is more than enough for verbose output; however, if you are still unsatisfied, you can increase the verbosity level by adding another “v” such as -vv or even -vvvv.

-oN <filename> - Normal output
-oX <filename> - XML output
-oG <filename> - grep-able output (useful for grep and awk)
-oA <basename> - Output in all major formats

'-sL	List scan – list targets without scanning
Host Discovery	
-sn	Ping scan – host discovery only
Port Scanning	
-sT	TCP connect scan – complete three-way handshake
-sS	TCP SYN – only first step of the three-way handshake
-sU	UDP Scan
-F	Fast mode – scans the 100 most common ports
-p[range]	Specifies a range of port numbers – -p- scans all the ports
-Pn	Treat all hosts as online – scan hosts that appear to be down
Service Detection	
-O	OS detection
-sV	Service version detection
-A	OS detection, version detection, and other additions
Timing	
-T<0-5>	Timing template – paranoid (0), sneaky (1), polite (2), normal (3), aggressive (4), and insane (5)
--min-parallelism <numprobes> and --max-parallelism <numprobes>	Minimum and maximum number of parallel probes
--min-rate <number> and --max-rate <number>	Minimum and maximum rate (packets/second)
--host-timeout	Maximum amount of time to wait for a target host
Real-time output	
-v	Verbosity level – for example, -vv and -v4
-d	Debugging level – for example -d and -d9
Report	
-oN <filename>	Normal output
-oX <filename>	XML output
-oG <filename>	grep-able output
-oA <basename>	Output in all major formats"



