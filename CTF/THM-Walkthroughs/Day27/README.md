## Day 27
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Metasploit: Introduction**](https://tryhackme.com/room/metasploitintro)
---

**Main Components of Metasploit**

- **Exploit**: A piece of code that takes advantage of a vulnerability on the target system.  
- **Vulnerability**: A design, coding, or logic flaw that affects the target system.  
- **Payload**: Code that runs on the target system after an exploit succeeds. An exploit uses a vulnerability; a payload delivers the action you want to perform on the target.

**Auxiliary**: Supporting modules such as scanners, crawlers, and fuzzers.  
**Encoders**: Encode exploit and payload bytes so signature-based antivirus solutions may miss them. Signature-based antivirus products compare suspicious files to a database of known threats, so encoders have a limited success rate.  
**Evasion**: Evasion modules attempt to bypass antivirus or detection systems; encoders are not a guaranteed evasion method.  
**NOPs**: "No Operation" instructions literally do nothing. On the Intel x86 CPU family a NOP is 0x90; after it executes the CPU spends one cycle doing nothing. NOP sleds are often used as padding to achieve consistent payload sizes.

**Payload directories (4 types):** adapters, singles, stagers, and stages
- **Adapters**: Wrap single payloads to convert them into different formats. For example, a single payload can be wrapped inside a PowerShell adapter to produce a single PowerShell command that executes the payload.  
- **Singles**: Self-contained payloads (add a user, launch notepad.exe, etc.) that do not need to download additional components.  
- **Stagers**: Set up a connection channel between Metasploit and the target system. Useful when working with staged payloads. A "staged payload" first uploads a small stager to the target, which then downloads the remainder (the stage). This reduces the initial payload size sent to the target.  
- **Stages**: Downloaded by the stager; they allow use of larger payloads delivered in pieces.

**Post**: Modules useful during the final stages of a penetration test (post-exploitation tasks).

**Working with modules**

- **RHOSTS**: "Remote host" — the IP address(es) of the target system. You can set a single IP, a CIDR range (/24, /16, etc.), a start–end range (10.10.10.x–10.10.10.y), or a file containing targets (one per line) using `file:/path/to/targets.txt`.  
- **RPORT**: "Remote port" — the port on the target system where the vulnerable service runs.  
- **PAYLOAD**: The payload to use with the exploit.  
- **LHOST**: "Local host" — the attacking machine's IP address.  
- **LPORT**: "Local port" — the port on your attacking machine that the reverse shell will connect back to. Choose a port not already used by another application.  
- **SESSION**: Each connection to a target created by Metasploit has a session ID. Use this with post-exploitation modules to interact with an existing session.

`setg` sets a value globally so it can be used by default across modules.  
`exploit -z` runs the exploit and backgrounds the session as soon as it opens.  
To interact with a session use `sessions -i <session_number>`.
