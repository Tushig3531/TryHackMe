## Day 21
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Networking Essentials**](https://tryhackme.com/room/networkingessentials)
---
### **Message**
For today’s Capture the Flag challenge, I focused on deepening my understanding of core networking concepts — specifically how devices communicate, how IP addresses are assigned, and how data travels across the Internet.  
Throughout this room, I learned how DHCP automates network configuration, how ARP bridges IP and MAC addresses, how ICMP helps troubleshoot networks, how routing protocols manage traffic paths, and how NAT allows multiple devices to share a single Internet connection. These protocols together form the backbone of modern network communication.

---

### **DHCP: Give Me My Network Settings**

The **Dynamic Host Configuration Protocol (DHCP)** is a network management protocol used on IP networks to automatically assign IP addresses and other configuration parameters to devices. It uses a **client–server** architecture and operates at the **application layer**, relying on **UDP**.

DHCP follows the four-step **DORA** process:

1. **DHCP Discover** – The client broadcasts a message to find a local DHCP server.  
2. **DHCP Offer** – The server replies with an available IP address for the client.  
3. **DHCP Request** – The client requests to use the offered IP address.  
4. **DHCP Acknowledge** – The server confirms and assigns the IP to the client.

In this exchange:
- The client starts without an IP address, using `0.0.0.0` as the source and broadcasting to `255.255.255.255`.
- At the link layer, it uses the broadcast MAC address `ff:ff:ff:ff:ff:ff` until the DHCP server responds.
- Once the process finishes, the client receives:
  - A **leased IP address**  
  - A **gateway** to access external networks  
  - A **DNS server** to resolve domain names  

---

### **ARP: Bridging Layer 3 to Layer 2**

**Address Resolution Protocol (ARP)** helps devices map **IP addresses (Layer 3)** to **MAC addresses (Layer 2)** within the same local network.  
Devices don’t always know each other’s MAC addresses — they only need them during communication.

- ARP operates directly over **Ethernet**, not encapsulated within IP or UDP.  
- It sends **ARP Request** and **ARP Reply** messages to find the hardware address corresponding to an IP address.

---

### **ICMP: Troubleshooting Networks**

**Internet Control Message Protocol (ICMP)** is used for diagnostics and error reporting.

- **ping** – Tests connectivity to a target system and measures **round-trip time (RTT)** to confirm the host is reachable.  
- **traceroute** – Traces the route that packets take to reach the destination, identifying every router (hop) in between.

**How traceroute works:**  
Each IP packet has a **Time-to-Live (TTL)** field that decreases by one at every router. When TTL reaches zero, the router discards the packet and sends back an **ICMP Time Exceeded** message. This allows traceroute to map the routers (destinations) your request travels through on its way to the final server.

---

### **Routing**

Routing is how packets find their way across networks using routers and protocols that share and calculate paths.

**Main Routing Protocols:**

- **OSPF (Open Shortest Path First):**  
  Builds a complete map of the network using link-state information, choosing the most efficient paths.  

- **EIGRP (Enhanced Interior Gateway Routing Protocol):**  
  A Cisco proprietary protocol combining distance-vector and link-state features to optimize routes.  

- **BGP (Border Gateway Protocol):**  
  The **main Internet routing protocol** used between ISPs. It manages how packets travel between independent networks globally.  

- **RIP (Routing Information Protocol):**  
  A simple distance-vector protocol for small networks. Routes are selected based on the **fewest hops** between devices.

---

### **NAT: Network Address Translation**

**NAT (Network Address Translation)** allows multiple devices on a private network to share a single public IP address for Internet access.  
It works by:

1. Taking all outgoing requests from devices on the private network.  
2. Replacing each device’s private IP with the router’s public IP.  
3. Keeping a **translation table** that maps which private device made each request.  
4. When a website responds, NAT uses that table to send the reply to the correct internal device.

This allows many private IPs (like `192.168.x.x`) to share one public IP, efficiently using the limited pool of global IP addresses.
