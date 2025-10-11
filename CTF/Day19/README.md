## Day 19
### [**Streak**](https://tryhackme.com/Tushig3531/streak) 
---
**Message**
For today’s Capture the Flag challenge, I decided to focus more on understanding why and how each step works rather than just completing the tasks quickly. My goal was to strengthen my knowledge of Windows systems and the command line, which are both essential for cybersecurity. Throughout the lecture, I learned how to use PowerShell and explored the history behind Linux. I also discovered how helpful PowerShell aliases are — short commands that act as shortcuts for longer cmdlets. Memorizing these will definitely make my workflow faster and help me navigate systems more efficiently.
**Rooms Completed**
[**Windows PowerShell**](https://tryhackme.com/room/windowspowershell)
[**Linux Shells**](https://tryhackme.com/room/linuxshells)

---
Alias
| Alias | Actual Command | Description |
|---|---|---|
| `ls` | `ls --color=auto` | Lists directory contents with colors |
| `ll` | `ls -alF` | Detailed list (permissions, size, owner) |
| `la` | `ls -A` | Lists all files except `.` and `..` |
| `l` | `ls -CF` | Compact list of files and directories |
| `grep` | `grep --color=auto` | Highlights search terms in color |
| `fgrep` | `fgrep --color=auto` | Fixed-string grep with color output |
| `egrep` | `egrep --color=auto` | Extended-regex grep with color output |
| `rm` | `rm -i` | Prompts before deleting (interactive) |
| `cp` | `cp -i` | Prompts before overwriting files |
| `mv` | `mv -i` | Prompts before moving/renaming files |
| `df` | `df -h` | Disk space usage (human-readable) |
| `du` | `du -h` | Directory/file sizes (human-readable) |
| `cls` / `clear` | `clear` | Clears the terminal screen |
| `history` | `history` | Shows command history |
| `..` | `cd ..` | Move one directory up |
| `...` | `cd ../../` | Move two directories up |
| `vi` | `vim` | Open file with Vim |
| `reboot` | `systemctl reboot` | Reboot system |
| `halt` | `systemctl halt` | Halt system |

---
## Additional
Networking & System Information Aliases
| Alias | Actual Command | Description |
|---|---|---|
| `ipconfig` | `ifconfig` | Show network interfaces (for users switching from Windows) |
| `ports` | `netstat -tulanp` | List open ports and associated processes |
| `myip` | `curl ifconfig.me` | Show public IP address |
| `pingg` | `ping -c 5 google.com` | Ping google.com 5 times |
| `path` | `echo -e ${PATH//:/\\n}` | Print PATH variable one entry per line |
| `topcpu` | `ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu \| head` | Top CPU-consuming processes |
| `topmem` | `ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem \| head` | Top memory-consuming processes |
| `ips` | `hostname -I` | Display local IP addresses |
---
Pentesting
| Alias | Actual Command | Description |
|---|---|---|
| `ports` | `sudo netstat -tulnp` | List active ports and services (requires sudo) |
| `nmapscan` | `nmap -sS -sV -A` | Basic aggressive Nmap scan |
| `dirsearch` | `gobuster dir -u` | Quick gobuster directory brute-force starter (requires args) |
| `extracthash` | `cat /etc/shadow \| cut -d: -f1,2` | Extract usernames and hash fields (requires root) |
| `serve` | `python3 -m http.server 8080` | Start a simple HTTP server on port 8080 |
| `rev` | `rlwrap nc -lvnp 4444` | Start a netcat listener for reverse shells (uses rlwrap) |
| `findsuid` | `find / -perm -4000 2>/dev/null` | Find SUID binaries |
| `findcap` | `getcap -r / 2>/dev/null` | Find binaries with file capabilities |
| `enum` | `linpeas.sh` | Run LinPEAS enumeration (must have script available) |
---
