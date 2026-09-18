## Day 47
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**FlareVM: Arsenal of Tools**](https://tryhackme.com/room/flarevmarsenaloftools)
---
FrareVM (Forensics, Logic Analysis, and Reverse Engineering) is a collection of tools designed for reverse engineering, malware analyst, incident responders, pentesters. 

**Reverse Engineering & Debugging**: solving backward
- Ghidra : NSA-developed open-source reverse engineering suite
- x64dbg : Open-source debugger for binaries in x64 and x32 formats.
- OllyDbg : Debugger for reverse engineering at the assembly level.
- Radare2 : A sophisticated open-source platform for reverse engineering.
- Binary Ninja : A tool for disassembling and decompiling binaries.
- PEiD : Packer, cryptor, and compiler detection tool.

**Disassemblers & Decompilers:** tools in malware analysis: understand malicious software’s behaviour, logic, and control flow
- CFF Explorer : A PE editor designed to analyze and edit Portable Executable (PE) files.
- Hopper Disassembler : A Debugger, disassembler, and decompiler.
- RetDec : Open-source decompiler for machine code.

**Static & Dynamic Analysis:** examining malware
Static analysis involves inspecting the code without executing it, while dynamic analysis involves observing its behaviour as it runs. 
- Process Hacker : Sophisticated memory editor and process watcher.
- PEview : A portable executable (PE) file viewer for analysis.
- Dependency Walker : A tool for displaying an executable’s DLL dependencies.
- DIE (Detect It Easy) : A packer, compiler, and cryptor detection tool.

**Forensics & Incident Response:** collection, analysis, and preservation of digital evidence
- Volatility : RAM dump analysis framework for memory forensics.
- Rekall : Framework for memory forensics in incident response.
- FTK Imager : Disc image acquisition and analysis tools for forensic use.

**Network Analysis:** 
- Wireshark : Network protocol analyzer for traffic recording and examination.
- Nmap : A vulnerability detection and network mapping tool.
- Netcat : Read and write data across network connections with this helpful tool.

**File Analysis:**
- FileInsight : A program for looking through and editing binary files.
- Hex Fiend : Hex editor that is light and quick.
- HxD : Binary file viewing and editing with a hex editor.

**Scripting & Automation:**
- Python
- PowerShell Empire - Framework for PowerShell post-exploitation.

**Sysinternals Suite:**  system utilities designed to help IT professionals and diagnose Windows
- Autoruns : Shows what executables are configured to run during system boot-up.
- Process Explorer : Provides information about running processes.
- Process Monitor : Monitors and logs real-time process/thread activity.

---
Process Monitor (Procmon) : help you record issues with our system's apps. It lets us see, record, and keep track of system and Windows file activity in real-time. Process Monitor is also helpful for tracking system activity, especially regarding malware research, troubleshooting, and forensic investigations.

Process Explorer (Procexp) : offers in-depth insights into the active processes running on our computer.

HxD : quick and flexible hex editor for editing files, memory, and drives of any capacity.

CFF Explorer : generate file hashes for integrity verification, authenticate the source of system files, and validate their validity

PEStudio : Static analysis, or studying executable file properties without running the files, is done with PEstudio.

FLOSS : automatically extracts and de-obfuscates all strings from malware programs

set_UseShellExecute: This function allows the process to use the operating system's shell to execute other processes. This is often seen in malware that spawns additional processes to carry out malicious actions.

CryptoStream, RijndaelManaged, CipherMode, CreateDecryptor: These APIs indicate that the executable uses cryptographic functions, specifically Rijndael (AES encryption). Malware may use cryptography to encrypt communication and files or even implement ransomware functionality.




