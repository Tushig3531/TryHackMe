## Day 20
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Networking Concepts**](https://tryhackme.com/room/networkingconcepts)
**Message**  
Today, I have learned about the fundamentals of computer networking, focusing on how data travels across systems using standardized models and protocols.  

In this session, I explored the OSI model and the TCP/IP model, understanding how each layer plays a role in network communication. I learned how the OSI model consists of seven layers — from the Physical Layer that manages hardware connections to the Application Layer that interacts with end-user applications. Each layer serves a specific purpose and communicates with the layers directly above and below it.  

Then compared the TCP/IP model, which simplifies these concepts into four layers: Application, Transport, Internet, and Link. I learned how TCP/IP is a practical implementation used on the Internet today, combining some of the OSI layers for efficiency.

I also learned about IP addresses and subnets, particularly how IPv4 is structured using four octets ranging from 0–255. Then I learned the difference between public and private IP addresses, including the three private IP ranges defined by RFC 1918, and how routers use Network Address Translation (NAT) to allow private networks to connect to the Internet securely.

Next, I explored routing, which is the process of directing data packets through multiple routers until they reach their destination. This concept ties into Layer 3 (Network Layer) of the OSI model.

We also studied the Transport Layer protocols — UDP and TCP.  
- **UDP (User Datagram Protocol)** is fast and connectionless, ideal for real-time communication but without delivery guarantees.  
- **TCP (Transmission Control Protocol)** is reliable and connection-oriented, using mechanisms like the three-way handshake (SYN, SYN-ACK, ACK) to ensure data is sent and received correctly.

After that, I learned about encapsulation, the process where each OSI layer adds its own header to the data as it moves down the stack. This helps each layer perform its own function independently — for example, the Application Layer formats data, the Transport Layer segments it, and the Network Layer adds IP headers before the Data Link and Physical layers transmit it physically.

Finally, I learned how to use Telnet as a practical tool to connect to servers and test open TCP ports. Even though Telnet is now replaced by SSH for security reasons, it’s still useful for checking connectivity and understanding how TCP communication works.

In short, this room helped me understand the core principles of how networks operate, from how data is structured and routed, to how protocols like TCP and UDP ensure communication between systems.

---
## OSI Model

**OSI Open Systems Interconnection**

The OSI model is a conceptual framework developed by the **International Organization for Standardization (ISO)** that describes how communications occur in a computer network.  
It provides a **standardized structure** for how different networking systems communicate with each other.

In simple terms, the OSI model is a **framework for computer network communications** divided into **seven layers**, each with its own responsibilities:

1. **Physical Layer** → Manages the physical connection between devices.
2. **Data Link Layer** → Handles data transfer between nodes on the same network segment.
3. **Network Layer** → Focuses on sending data between two nodes across different networks. It handles logical addressing and routing (finding a path for packets).  
   Examples: Internet Protocol (IP), Internet Control Message Protocol (ICMP), Virtual Private Network (VPN) protocols such as IPSec and SSL/TLS VPN.
4. **Transport Layer** → Enables end-to-end communication between applications running on different hosts.  
   Examples: Transmission Control Protocol (TCP) and User Datagram Protocol (UDP)
5. **Session Layer** → Establishes, maintains, and synchronizes communication between applications. It ensures data is transmitted in order and allows recovery from transmission failures.  
   Examples: Network File System (NFS), Remote Procedure Call (RPC)
6. **Presentation Layer** → Ensures the data is delivered in a form the application layer can understand (handles **encoding, compression, and encryption**).  
   Examples: Unicode, MIME, JPEG, PNG, MPEG
7. **Application Layer** → Provides services directly to user applications (like web browsers or email clients).  
   Examples: HTTP, FTP, DNS, POP3, SMTP, IMAP

### OSI Model Summary Table

| Layer | Name | Function | Examples |
|:--|:--|:--|:--|
| 7 | Application Layer | Providing services and interfaces to applications | HTTP, FTP, DNS, POP3, SMTP, IMAP |
| 6 | Presentation Layer | Data encoding, encryption, and compression | Unicode, MIME, JPEG, PNG, MPEG |
| 5 | Session Layer | Establishing, maintaining, and synchronizing sessions | NFS, RPC |
| 4 | Transport Layer | End-to-end communication and data segmentation | UDP, TCP |
| 3 | Network Layer | Logical addressing and routing between networks | IP, ICMP, IPSec |
| 2 | Data Link Layer | Reliable data transfer between adjacent nodes | Ethernet (802.3), WiFi (802.11) |
| 1 | Physical Layer | Physical data transmission media | Electrical, optical, and wireless signals |

---

## TCP/IP Model

The **TCP/IP model** is another networking framework that maps to the OSI model. It simplifies communication into four layers instead of seven.

**Mapping between OSI and TCP/IP layers:**
- **Application Layer (TCP/IP)** → combines OSI’s Application, Presentation, and Session layers  
- **Transport Layer**
- **Internet Layer**
- **Link Layer**

### TCP/IP

| Layer Number | ISO OSI Model | TCP/IP Model (RFC 1122) | Protocols |
|:--|:--|:--|:--|
| 7 | Application Layer | Application Layer | HTTP, HTTPS, FTP, POP3, SMTP, IMAP, Telnet, SSH |
| 6 | Presentation Layer |  |  |
| 5 | Session Layer |  |  |
| 4 | Transport Layer | Transport Layer | TCP, UDP |
| 3 | Network Layer | Internet Layer | IP, ICMP, IPSec |
| 2 | Data Link Layer | Link Layer | Ethernet (802.3), WiFi (802.11) |
| 1 | Physical Layer |  |  |

---

## IP Addresses and Subnets

Whenever an **IP** is mentioned without version, it usually refers to **IPv4**.

An IPv4 address is composed of **four octets**, each containing **8 bits**, allowing decimal values between **0 and 255**.

Octet #1 --> 0-255
Octet #2 --> 0-255
Octet #3 --> 0-255
Octet #4 --> 0-255

### Private Addresses

There are two main types of IP addresses:
- **Public IP addresses**
- **Private IP addresses**

RFC 1918 defines the private address ranges:
- `10.0.0.0 - 10.255.255.255` (10/8)
- `172.16.0.0 - 172.31.255.255` (172.16/12)
- `192.168.0.0 - 192.168.255.255` (192.168/16)

- **Public IP Address** → like your home’s postal address, reachable from the internet.  
- **Private IP Address** → used internally, not reachable from the outside world (like houses inside a gated community).  

To connect to the internet, a device with a private IP must go through a **router with a public IP** that performs **Network Address Translation (NAT)**.

---

## Routing

A **router** forwards data packets to the correct network.  
Packets may pass through several routers before reaching the final destination.

Routers operate at **Layer 3 (Network Layer)**, inspecting the **IP address** and forwarding packets toward the best route.

---

## UDP and TCP

The **IP protocol** lets us reach a destination host identified by an IP address.  
However, to reach a specific process on that host, we need **port numbers**.

### UDP (User Datagram Protocol)

- **Connectionless** and **faster**
- No acknowledgment or connection setup
- Operates at **Layer 4 (Transport Layer)**
- Used for speed over reliability

**Port numbers** range from **1 to 65535** (port 0 is reserved).  
Because UDP doesn’t verify delivery, it’s ideal for real-time applications like streaming or gaming.

### TCP (Transmission Control Protocol)

- **Connection-oriented**
- Provides reliable, ordered data delivery
- Uses sequence and acknowledgment numbers to manage packet order
- Operates at **Layer 4**

**TCP 3-Way Handshake:**
1. **SYN Packet:** Client initiates connection with a SYN packet containing an initial sequence number.
2. **SYN-ACK Packet:** Server responds with a SYN-ACK packet and its own sequence number.
3. **ACK Packet:** Client acknowledges receipt, completing the handshake.

---

## Encapsulation

Encapsulation ensures each network layer focuses on its own role.  
Each layer **adds its own header** to the data as it passes downward through the OSI stack.

**Steps:**
1. **Application Data:** The user sends data through an application (e.g., a browser).  
2. **Transport Layer:** TCP or UDP adds headers (port info, sequence numbers) → creates a segment/datagram.  
3. **Network Layer:** Adds IP header (source/destination IPs) → creates a packet.  
4. **Data Link Layer:** Adds frame header/trailer (MAC addresses) → creates a frame.  
5. **Physical Layer:** Sends binary data through cables or wireless signals.

**Example (Web Search):**
1. Enter search in a browser.  
2. Browser forms HTTP request → sends to Transport layer.  
3. TCP establishes 3-way handshake → sends HTTP request.  
4. IP layer adds source/destination addresses.  
5. Link layer adds Ethernet/Wi-Fi headers → sends to router.  
6. Router inspects IP headers and forwards packet until it reaches destination.

---

## Telnet

**Telnet (Teletype Network)** is a network protocol used for **remote terminal connections**.  
It allows communication with a remote system to issue text-based commands.

- Operates over **TCP**
- Commonly used for testing **open ports** or **manual server communication**
