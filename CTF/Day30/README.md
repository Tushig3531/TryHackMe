## Day 30
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Metasploit: Meterpreter**](https://tryhackme.com/room/meterpreter)
---
Meterpreter is a Metasploit payload that supports the penetration-testing process with multiple components. Meterpreter will run on the target system and act as an agent within a command-and-control architecture.

**How does Meterpreter work?**
- Runs on the target system without being installed.
- It runs in memory and does not write itself to disk on the target.
These features aim to avoid detection by antivirus scans.

By default, most antivirus software scans new files on disk, but Meterpreter runs in memory.

Meterpreter also aims to avoid detection by network-based IPS (Intrusion Prevention System) and IDS (Intrusion Detection System) by using encrypted communication with the server where Metasploit runs.

Meterpreter versions are available for the following platforms:
- Android, iOS, Java, Linux, macOS, PHP, Python, Windows

The decision on which Meterpreter to use will be mostly based on three factors:
- The target operating system
- Components available on the target system
- Network connection types available to the target system

Meterpreter provides three primary categories of tools:
- Built-in commands
- Meterpreter tools
- Meterpreter scripting

The `help` command will list:
- Core commands: background, exit, guid, help, info, irb, load, migrate, run, sessions
- File system commands: cd, ls, pwd, edit, cat, rm, search, upload, download
- Networking commands: arp, ifconfig, netstat, portfwd, route
- System commands: clearev, execute, getpid, getuid, kill, pkill, ps, reboot, shell, shutdown, sysinfo
- User interface commands
- Webcam commands
- Audio output commands
- Elevation commands
- Password database commands
- Timestamp commands

**Meterpreter commands**
- `getuid`: Display the user account under which Meterpreter is currently running.
- `ps`: List running processes on the target.
- `migrate`: Migrate to another process so Meterpreter can interact with it. For example, if you see a word processor running on the target (e.g., winword.exe, notepad.exe), you can migrate to that process to remain stable and continue actions such as keylogging.
- `keyscan_start`, `keyscan_stop`, `keyscan_dump`: Make Meterpreter act like a keylogger (start/stop logging and dump captured keystrokes).
- `hashdump`: Dump the contents of the SAM database (Security Account Manager). The SAM stores user password hashes on Windows systems.
- `search`: Locate files on the target system.
- `shell`: Launch a system command-line shell on the target.