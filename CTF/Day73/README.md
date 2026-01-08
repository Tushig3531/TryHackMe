## Day 73
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Wireshark: Traffic Analysis**](https://tryhackme.com/room/wiresharktrafficanalysis)
---
To learn more deeply, I started writing everything down to get a better understanding.
Today's learning **Identifying Hosts: DHCP**

Today’s study helped me understand what DHCP is, why it’s used in real life, and how it works to automatically configure a device when it joins a network. I learned that when a device connects to Wi-Fi or Ethernet, it may not yet have a usable IP address, so it broadcasts a DHCP request. The DHCP server then offers the device a local IP address along with key settings like the subnet mask, default gateway, DNS servers, and a lease time. The device accepts the offer and the server confirms it, allowing the device to communicate on the network.

I also learned how public internet access relates to this process. DHCP usually gives my device a local/private IP address on the Wi-Fi network, while websites on the internet typically see the public IP address of the router or network because of NAT. This explains why many devices on the same public Wi-Fi can appear to share one public IP. 

[View my Day 73 notes (PDF)](Identifying_Hosts-DHCP-Wireshark-Traffic_Analysis.pdf)