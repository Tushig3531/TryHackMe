.
## Day 43
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Firewall Fundamentals**](https://tryhackme.com/room/firewallfundamentals)
[**IDS Fundamentals**](https://tryhackme.com/room/idsfundamentals)

---

### Firewall Fundamentals 

- Firewall is designed to inspect a network's or digital device’s incoming and outgoing traffic.
- Anything that comes in or goes out of your device or network would face the firewall first.

Types of Firewalls:
- Stateless Firewall : Basically it doesn't even care about the previous activities or connections. Even though the device was passing multiple times without an issue, this type of firewall will not care about it and still checks and the connection must the rules no matter when it comes
- Stateful Firewall : So basically this type of firewall keeps remember the connection did, if the previous connection went through without any issue or passing all the rules and any suspicion, it will state that and for the next time firewall will accept the connection without any issue. But, if any issue occur, it can block any connections from the route or connection
- Proxy Firewall : This firewall acts like intermediary between users and the resources they’re trying to access. Instead of letting traffic pass directly between a client and a server, it receives the request, inspects it, and then forwards it if it’s safe. Basically, looks at the connection, and choose whether block or pass
- Next-Generation Firewall : Most advenced firewall, lay in level 3 and level 7. This offers deep packet inspection and other functionalities that enhance the security of incoming and outgoing network traffic. It has an intrusion prevention system that blocks malicious activities in real time. It offers heuristic analysis by analyzing the patterns of attacks and blocking them instantly before reaching the network. NGFWs have SSL/TLS decryption capabilities, which inspect the packets after decrypting them and correlate the data with the threat intelligence feeds to make efficient decisions.

Firewalls                    Characteristics
---------------------------------------------------------------------------
Stateless firewalls          - Basic filtering
                             - No track of previous connections
                             - Efficient for high-speed networks

Stateful firewalls           - Recognize traffic by patterns
                             - Complex rules can be applicable
                             - Monitor the network connections

Proxy firewalls              - Inspect the data inside the packets as well
                             - Provides content filtering options
                             - Provides application control
                             - Decrypts and inspects SSL/TLS data packets

Next-generation firewalls    - Provides advanced threat protection
                             - Comes with an intrusion prevention system
                             - Identify anomalies based on heuristic analysis
                             - Decrypts and inspects SSL/TLS data packets


Inbound rule : Rules are categorized as inbound rules when they are meant to be applied to incomming traffic only
Outbound rule: These rules are made for outgoing traffic only.
Forward Rules : Forwarding rules are created to forward specific traffic inside the network. 

** Linux Firewall **
* Netfilter : Linux framework including packet filtering, NAT, and connection tracking.
Utilities that works with Netfilter:
- iptables : uses the Netfilter framework that provides various functionalities to control network traffic
- nftables : successor to the "iptables", with enhanced packet filtering and NAT capabilities. 
- firewalld : has predefined rule sets. 
* ufw (Uncomplicated Firewall) : eliminates the complications of making rules in a complex syntax in “iptables”(or its successor) by giving you an easier interface. It is more beginner-friendly. 

---

### IDS Fundamentals

For in case, if the attacker passed the firewall via a legitimate looking connection. In that case, we will need another security system in the system which we call, "Intrusion Detection System (IDS)"

 IDS’s main categorization depends on its deployment and detection modes:
 
 Deployment :
 - Host Intrusion Detection System (HIDS) : Host-based IDS solutions are installed individually on the hosts and are responsible for only detecting potential security threats associated with that particular host. 
 - Network Intrusion Detection System (NIDS): Network-based IDS solutions are crucial in detecting potentially malicious activities within the whole network, regardless of any specific hosts.
Detection :
- Signature based IDS : Can only detect the attacks that happened previously, and its signatures (patterns) are saved inside the database. Basically, this detection based on what they have learned and trained their system from the last attack and if the same process happens it detects it
- Anomaly based IDS : Detect abnormalities inside the network or system by comparing the current state with the normal behavior (baseline). Basically it marks all the activity malicious and believe anything behaving unusually is malicious
- Hybrid IDS : Combines the detection methods of signature-based IDS and anomaly-based IDS to leverage the strengths of each approach. Everything is malicious but the signatures are even more suspicious. But if anything new happens, it will be also be able to detect.

** Snort **
It uses hybrid IDS.
Snort has 3 modes:
* Packet Sniff mode 
    - This mode reads and displays network packets without performing any analysis on them. The packet sniffer mode of Snort does not directly relate to IDS capabilities, but it can be helpful in network monitoring and troubleshooting. In some cases, system administrators might need to read the traffic flow without performing any detection to diagnose specific issues. In this case, they can utilize the packet sniffer mode of Snort. This mode allows you to display the network traffic on the console or even output it in a file.
    - The network team observes some network performance issues. To diagnose the issue, they need detailed insights into the network traffic. For this purpose, they can utilize Snort’s packet sniffer mode.
* Packet loggin mode  
    - Snort performs detection on the network traffic in real-time and displays the detections as alerts on the console for the security administrators to take action. However, in some cases, the network traffic needs to be logged for later analysis. The packet logging mode of Snort allows you to log the network traffic as a PCAP (standard packet capture format) file. This includes all the network traffic and any detections from it. Forensic investigators can use these Snort log files to perform the root cause analysis of previous attacks.
    - The security team needs to initiate a forensic investigation of a network attack. They would need the traffic logs to perform the root cause analysis. The network traffic logged through Snort’s packet logging mode can help them.
* NIDS mode 
    - Monitors network traffic in real-time and applies its rule files to identify any match to the known attack patterns stored as signatures. If there is a match, it generates an alert. This mode provides the main functionality of an IDS solution. 
    
    
Rules Format:
```nginx
alert icmp any_1 any_2 -> $HOME_NET any_3 (msg:"ping detected"; sid:10001; rev:1;)
```
alert --> action
icmp --> protocol
any_1 --> source_ip
any_2 --> source_port
$HOME_NET --> destination_ip 
any_3 --> destination_port --> port the traffic would reach
msg --> message --> indicate the type of activity
sid --> signature id --> unique identifier, and tells which rule
rev --> rule_revision --> Every time the rule is modified, its revision number is incremented

```nginx
alert protocol source_ip source_port -> destination_ip destination_port (message:"", signature_id, rule_revision)
```


