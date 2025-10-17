## Day 25
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Tcpdump: The Basics**](https://tryhackme.com/room/tcpdump)
---

We access resources on our local network without ever seeing an "Address Resolution Protocol" ARP.
Address Resolution Protocol (ARP) is responsible for finding the MAC address related to a specific IP address.

This room introduces some basic command-line arguments for using Tcpdump. 
The Tcpdump tool and its libpcap library are written in C and C++ and were released for Unix-like systems. 
In Microsoft Windows was winpcap

**Basic Packet Capture**

Specify the Network Interface

```bash
ip address show 
```
List the available network interfaces
For example:
```text
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: ens5: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP group default qlen 1000
    link/ether 16:ff:c5:88:e4:b7 brd ff:ff:ff:ff:ff:ff
    altname enp0s5
    inet 10.201.7.215/17 brd 10.201.127.255 scope global dynamic ens5
       valid_lft 3200sec preferred_lft 3200sec
    inet6 fe80::14ff:c5ff:fe88:e4b7/64 scope link 
       valid_lft forever preferred_lft forever
```
So, the interface is lo and ens5

Save the Captured Packets: **-w FILE**
Read Captured Packets from a File: **-r FILE**
Limit the Number of Captured Packets: **-c COUNT**

By default, tcpdump tries to make the output more readable by resolving, IP addressed into domain names and port numbers into service names. 
For example: google.com instead of 142.250.72.14, and http instead of port 80
Sp, to keep the output fast, raw, and exact, we can disable these lookups:
-n : Don't resolve IP addresses, just show IPs
-nn : Don't resolve IP addresses or port numbers (show both as numbers)

- **tcpdump -i INTERFACE** → Captures packets on a specific network interface  
- **tcpdump -w FILE** → Writes captured packets to a file  
- **tcpdump -r FILE** → Reads captured packets from a file  
- **tcpdump -c COUNT** → Captures a specific number of packets  
- **tcpdump -n** → Don’t resolve IP addresses  
- **tcpdump -nn** → Don’t resolve IP addresses and don’t resolve protocol (port) numbers  
- **tcpdump -v** → Verbose display; verbosity can be increased with `-vv` and `-vvv`

Example: 
- tcpdump -i eth0 -c 50 -v : captures and displays 50 packets by listening on the eth0 interface, which is a wired Ethernet, and displas them berbsely
- tcpdump -i wlo1 -w data.pcap : captures packets by listening on the wlo1 interface (the WiFi interface) and writes the packets to data.pcap.
- tcpdump -i any -nn : captures packets on all interfaces and displays them on screen without domain name or protocl resolution

**Filtering Expressions**

Filtering by Host

We can easily limit the captured packets to this host using "host IP" or "host HOSTNAME". We capture all the packets exchanged with "tushge.com" and save them to http.pcap. It is important to note that capturing packets requires we to be logged-in as root or to use sudo.

Filtering by Port

Uf U want to capture all DNS traffic, we can lomit the captured packets to those on port 53. 
DNS uses UDP and TCP ports 53 by default. 
With this, we captured all the packets sent to or from a specific port number. 

Filtering by Protocol

We can limit our packet capture to a specific protocol
Example: ip, ip6, udp, tcp, icmp
```bash
sudo tcpdump -i ens5 icmp -n
sudo tcpdump -i ens5 ip -n
sudo tcpdump -i ens5 ip6 -n
sudo tcpdump -i ens5 udp -n
sudo tcpdump -i ens5 tcp -n
```
- **tcpdump host IP** or **tcpdump host HOSTNAME** → Filters packets by IP address or hostname  
- **tcpdump src host IP** → Filters packets by a specific source host  
- **tcpdump dst host IP** → Filters packets by a specific destination host  
- **tcpdump port PORT_NUMBER** → Filters packets by port number  
- **tcpdump src port PORT_NUMBER** → Filters packets by the specified source port number  
- **tcpdump dst port PORT_NUMBER** → Filters packets by the specified destination port number  
- **tcpdump PROTOCOL** → Filters packets by protocol (e.g., `ip`, `ip6`, `icmp`)

Example:
- tcpdump -i  any tcp port 22 : listens on all interfaces and captures tcp packets to or from port port 22, ssh traffic
- tcpdump -i wlo1 udp port 123 : listens on the WiFi network card and filters udp traffic to port 123, the Network Time Protocol (NTP)
- tcpdump -i eth0 host example.com and tcp port 443 -w https.pcap: listens on eth0, the wirted Ethernet interface and filter traffic exchanged with example.com that uses tcp and port 443. In other workds, this commands is filtering HTTPS traffic related to example.com

We count the lines by piping the output vie the wc command. 

**Advanced Filtering**
Using pcap-filter, Tcpdump allows you to refer to the contents of any byte in the header using the following systax prto[expr:size]
- proto refers to the protocol. For example: arp, ether, icmp, ip, ip6, tco and udp refer to ARP, Ethernet, ICP, IPv4, IPv6. TCP, and UDP respectively
- expr indictes the byte offset, where 0 refers to the first byte
- size indicated the number of bytes that interest us

We also can use tcp[tcpflags] to refer to the TCP flags field. THis following TCP flags are availbale to compare with:
- tcp-syn : TCP SYN (Synchronize)
- tcp-ack : TCP ACK (Acknowledge)
- tcp-fin : TCP FIN (Finish)
- tcp-rst : TCP RST (Reset)
- tcp-push 
based on this we can write it like: 
- tcpdump "tcp[tcpflags]==tcp-syn" : to capture TCP packets with only the SYN flag set, while all the other flags are unset
- tcpdump "tcp[tcpflags] & tcp-syn !=0" to capture TCP packets with at least the SYN flag set
- tcpdump "tcp[tcpflags] & (tcp-syn | tcp-ack) !=0" to capture TCP packets with at least the SYN or ACK

**Displaying Packets**

- -q : Quich output; print brief packet information
- -e : Print the link-level header
- -A : Show pacjet data in ASCII
- -xx : Show packet data in hexadecimal formatm referred to as hex
- -X : Show packet headers and data in hex and ASCII



