## Day 54
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Splunk: The Basics**](https://tryhackme.com/room/splunk101)
---
Splunk has three main components: Forwarder, Indexer and Search Head. 

Splunk Forwarder : its main task is to collect the data and send it to the Splunk instance, and it is lightweight agent installed on the endpoint for monitoring. 
- Web server generating web traffic
- Windows machine generating Windows Event Logs, PowerShell, and Sysmon data
- Linux host generating host-centric logs
- Database generating DB connection requests, reponses, and errors

Splunk Indexer : plays the main role in processing the data it receives from forwarders. It parses and normalizes the data into field-vale pairs, categorizes it, and stores the result as events

Search Head : The searches are done using the SPL (Search Processing Language). When the user preforms a search, the request is sent to the indexer, and the relevant events are returned as field-value pairs.

