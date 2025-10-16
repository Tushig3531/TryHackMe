## Day 24
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Wireshark: The Basics**](https://tryhackme.com/room/wiresharkthebasics)
---
**Tool Overview**
Wireshark is one of the most powerful traffic-analysis tools available. Common uses include:
- Detecting and troubleshooting network problems, such as failure points and congestion.
- Detecting security anomalies, such as rogue hosts, abnormal protocol usage, and suspicious traffic.
- Investigating and learning protocol details, such as response codes and payload contents.

Wireshark is not an Intrusion Detection System (IDS). It allows analysts to discover and investigate packets in depth but does not modify them. Detecting anomalies therefore depends heavily on the analyst’s knowledge and investigation skills.

### GUI
The Wireshark GUI has five main sections:
- **Toolbar:** Contains menus and shortcuts for packet capture and processing, including filtering, sorting, summarizing, exporting, and merging.
- **Display Filter Bar:** The main query and filtering area for display filters.
- **Recent Files**
- **Capture Filters and Interfaces:** Shows capture filters and available sniffing points (network interfaces). A network interface is the connection point between a computer and a network.
- **Status Bar:** Shows capture status and messages.

### Loading PCAP Files
**PCAP (packet capture)** is the practice of intercepting and recording data packets traveling over a network. Captured packets can be stored for later analysis. Inspecting these packets helps IT teams identify issues and resolve network problems that affect operations.

When a PCAP is loaded you can see the filename, the total number of packets, and packet details. Packet details are shown in three panes that present different views:
- **Packet List Pane:** Summary of each packet (source and destination addresses, protocol, and brief info).
- **Packet Details Pane:** Detailed protocol breakdown of the selected packet.
- **Packet Bytes Pane:** Hex and decoded ASCII representation of the selected packet. It highlights the packet field corresponding to the selection in the Details pane.

### Packet Coloring
Wireshark supports two types of packet-coloring rules:
- **Temporary rules:** Available only during the current program session.
- **Permanent rules:** Saved in preferences and persist across sessions.

### Traffic Sniffing
Click the blue "shark-fin" button to start capturing (sniffing) network traffic.

### Merge PCAP Files
You can merge an existing pcap file with another file to create a combined pcap for analysis.

### Packet Dissection
Packet dissection (protocol dissection) decodes protocol layers and fields for each packet. Wireshark supports many protocols and also allows custom dissectors or scripts.

- **The Frame (Layer 1):** Shows which frame/packet we are viewing and details related to the Physical layer.
```text
Frame 27: 214 bytes on wire (1712 bits), 214 bytes captured (1712 bits) on interface unknown, id 0
    Interface id: 0 (unknown)
    Encapsulation type: Ethernet (1)
    Arrival Time: May 13, 2004 10:17:11.266912000 UTC
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1084443431.266912000 seconds
    [Time delta from previous captured frame: 0.040058000 seconds]
    [Time delta from previous displayed frame: 0.040058000 seconds]
    [Time since reference or first frame: 3.955688000 seconds]
    Frame Number: 27
    Frame Length: 214 bytes (1712 bits)
    Capture Length: 214 bytes (1712 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ethertype:ip:tcp:http:data-text-lines]
    [Coloring Rule Name: HTTP]
    [Coloring Rule String: http || tcp.port == 80 || http2]
Ethernet II, Src: ff:ff:20:00:01:00 (ff:ff:20:00:01:00), Dst: Xerox_00:00:01 (00:00:01:00:00:00)
```
- Source [MAC] layer 2: This will show us the source and destination MAC address; from the Data Link layer of the OSI model
```text
Ethernet II, Src: fe:ff:20:00:01:00 (fe:ff:20:00:01:00), Dst: Xerox_00:00:00 (00:00:01:00:00:00)
```
- Source [IP] (layer 3): This will show us the osurce and destination IPv4 addresses; from the Network layer of the OSI model. 
```text
Internet Protocol Version 4, Src: 216.239.59.99, Dsy: 145.254.160.237
```
- Protocol (layer 4): This will show you details of the protocol used (UDP/TCP) and source and destination ports; from the Trnasport layer of the OSI model
```text
Transmission Control Protocol, Src Port: 80, Dst Port: 3371, Seq: 1431, Ack: 722, Len: 160
```
- Protocol Errors: This continuation of the 4th layer shows specific segments from TCP that needed to be reassembled
```text
[2 Reassemled TCP Segments (1590 bytes): #26(1430), #27(160)]
```
- Application Protocol (Layer 5): This will show details specific to the protocol used, such as HTTP, FTP, or more. From the Application layer of the OSI model.
```text
Hypertext Transfer Protocol
```
- Application Data: This extension of the 5th layer can show the application-specific data
```text
Line-based text data: text/html (3lines)
```
**Packet Navigation**

| **Severity** | **Colour** | **Info** |
|---------------|-------------|-----------|
| **Chat** | Blue | Information on usual workflow. |
| **Note** | Cyan | Notable events like application error codes. |
| **Warn** | Yellow | Warnings like unusual error codes or problem statements. |
| **Error** | Red | Problems like malformed packets. |



| **Group** | **Info** | **Group** | **Info** |
|------------|-----------|------------|-----------|
| **Checksum** | Checksum errors. | **Deprecated** | Deprecated protocol usage. |
| **Comment** | Packet comment detection. | **Malformed** | Malformed packet detection. |

**Packet Filtering**
Wireshark has two types of filtering approackes: capture and display filters. 
- Capture filters are used for "capturing" only the packets valid for the used filter
- Display filters are used for "viewing" the packets valid for the used filter

There are two different ways to filter traffic and remove the noise from the capture file
- First uses queries
- Right-click menu


**Follow Stream**
Wireshark displays everything in packet ortion size. However, it is possible to reconstruct the streams and view the raw traffic as it is prosented at the application level. It is also possible to view the unencrypted protocol data like usernames, passwords and other transferred data









