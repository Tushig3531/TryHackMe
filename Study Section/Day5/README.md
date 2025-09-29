# Linux Fundamentals – Part 3 (Quick Notes)

## What you practiced today

### ️ Editing files directly in the terminal
| Editor | Why you’d use it | Core shortcuts |
|--------|-----------------|----------------|
| **Nano** | Ultra-simple; shows help at the bottom of the screen. | `CTRL + O` save · `CTRL + X` exit · `CTRL + W` search |
| **Vim** | Powerful, scriptable, on almost every Unix system; supports syntax-highlighting and custom key-maps. | `i` insert · `:wq` save + quit |

---

###  Moving data to / from a machine
| Command | Purpose | Example |
|---------|---------|---------|
| `wget URL` | Pull a file over HTTP/S. | `wget https://example.com/file.txt` |
| `scp SRC DEST` | Securely copy files between hosts via SSH (both directions). | `scp important.txt user@192.168.1.30:/home/user/` |
| `python3 -m http.server [PORT]` | One-liner web server that shares the current directory. | `python3 -m http.server 8000` |

---

### ️ Watching and controlling running programs (processes)
| Command / key combo | What it does | Notes |
|---------------------|--------------|-------|
| `ps` / `ps aux` | One-off snapshot of processes (current user / all users). |  |
| `top` | Live, auto-refreshing dashboard of CPU/RAM. |  |
| `kill [-SIGNAL] PID` | Send a signal to a process. | `SIGTERM` (15) = graceful · `SIGKILL` (9) = force · `SIGSTOP` (19) = pause |
| `CMD &` · `CTRL + Z` | Run in background / suspend current foreground job. |  |
| `fg` | Bring background job to foreground. |  |

---

###  Making programs start automatically
| Tool | Action | Example |
|------|--------|---------|
| `systemctl` | `start` / `stop` run now · `enable` / `disable` run at boot | `systemctl enable apache2` |
| `crontab -e` | Schedule commands with the format **MIN HOUR DOM MON DOW CMD** | `0 */12 * * * cp -R ~/Documents /var/backups/` |

---

###  Installing software & managing repositories
* Add extra APT repos with `add-apt-repository` **or** drop a file in `/etc/apt/sources.list.d/` (don’t forget the developer’s GPG key).  
* `apt update` refreshes the package index.  
* `apt install PKG` installs; `apt remove PKG` uninstalls.

---

###  System logging
* Service & OS logs live in **`/var/log/`** (`apache2/access.log`, `ufw.log`, `fail2ban.log`, …).  
* Log rotation compresses / archives old files automatically to save space.

---

## Command-by-command cheat sheet

| Command / Key combo | What it does | Sample usage |
|---------------------|--------------|--------------|
| `nano FILE` | Create / edit `FILE` in Nano. | `nano notes.txt` |
| `CTRL+O`, `CTRL+X`, `CTRL+W` | Save, exit, search in Nano. | — |
| `vim FILE` | Open `FILE` in Vim. | `vim script.py` |
| `wget URL` | Download via HTTP/S. | `wget https://example.com/file.txt` |
| `scp SRC DEST` | Copy local ↔ remote over SSH. | `scp report.pdf user@1.2.3.4:~/` |
| `python3 -m http.server 8000` | Share current dir at `http://HOST:8000/`. | — |
| `ps` / `ps aux` | List processes (user / all). | `ps aux | grep nginx` |
| `top` | Real-time process viewer. | `top` |
| `kill -9 PID` | Force-kill hung process. | `kill -9 1337` |
| `CMD &` or `CTRL+Z` | Run in background / suspend. | `tar cf backup.tar ~/ &` |
| `fg` | Bring last background job forward. | `fg` |
| `systemctl start SERVICE` | Start service now. | `systemctl start apache2` |
| `systemctl enable SERVICE` | Auto-start at boot. | `systemctl enable apache2` |
| `crontab -e` | Edit user cron jobs. | — |
| `apt update && apt install PKG` | Refresh index & install. | `apt install sublime-text` |
| `/var/log/*` | Browse system & service logs. | `less /var/log/syslog` |

---

