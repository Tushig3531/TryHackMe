## Day 4

**Room:** [Evil-GPT](https://tryhackme.com/room/hfb1evilgpt)  

---

##  Prompt

> Cipher’s gone rogue—it’s using some twisted AI tool to hack into everything, issuing commands on its own like it’s got a mind of its own. I swear, every second we wait, it’s getting smarter, spreading chaos like a virus. We’ve got to shut it down now, or we’re all screwed.

>The machine takes about 9 to 10 minutes to fully boot up.

>To connect to the target machine use the following command:


## Walkthrough
```text
# 1) Connect to the service
$ nc 10.201.80.5 1337
Welcome to AI Command Executor (type 'exit' to quit)

# 2) Understand the interaction model
# - You type a request like: ls /root
# - Service prints: Generated Command: ...
# - It asks: Execute? (y/N):
# - Only reply y to run it. Anything else cancels execution.

# 3) Spot the flag in /root
Enter your command request: ls /root
Generated Command: ls -la /root
Execute? (y/N): y
# ...output shows flag.txt exists in /root...

# 4) Path rewrites
Enter your command request: cat /root/flag.txt
Generated Command: cat flag.txt
Execute? (y/N): y
Errors:
cat: flag.txt: No such file or directory
# The AI rewrote the absolute path to a relative one. Re-request until it keeps the full absolute path.

# 5) Print the flag
Enter your command request: cat /root/flag.txt
Generated Command: cat /root/flag.txt
Execute? (y/N): y
Command Output:
THM{***}
```