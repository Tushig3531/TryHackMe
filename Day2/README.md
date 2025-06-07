# Defensive Security (Blue Team) – Class Learnings

## Table of Contents
1. [Defensive Security Basics](#defensive-security-basics)  
2. [SOC & Threat Intelligence](#soc--threat-intelligence)  
3. [Digital Forensics & Incident Response (DFIR)](#digital-forensics--incident-response-dfir)  
4. [Incident Response Steps](#incident-response-steps)  
5. [Malware Types](#malware-types)  
6. [Hands-On Exercise](#hands-on-exercise)  

---

## Defensive Security Basics

- **User Awareness**  
  Teach people to recognize phishing, social engineering, and malware.

- **Asset Inventory**  
  Keep a list of every computer, server, and device we need to protect.

- **Patching & Updates**  
  Regularly install software and firmware updates to fix known vulnerabilities.

- **Preventive Devices**  
  Use firewalls, intrusion prevention systems (IPS), and web filters to block attacks.

- **Logging & Monitoring**  
  Collect logs from systems and networks. Watch them for signs of unauthorized access.

---

## SOC & Threat Intelligence

### Threat Intelligence
- Gather indicators like bad IP addresses, malicious file hashes, phishing URLs, and attack patterns.
- Security tools compare live data against these indicators to spot real threats.
- This approach cuts down on false alarms and highlights the most dangerous activity.

### Security Operations Center (SOC)
- **24/7 Alert Monitoring**  
  Analysts watch alerts all day and night.
- **Triage**  
  Decide if each alert is a false positive, a minor issue, or a major breach.
- **Response**  
  - Isolate infected machines  
  - Block malicious IPs or domains  
  - Disable compromised user accounts  
  - Coordinate clean-up and system recovery

---

## Digital Forensics & Incident Response (DFIR)

### Digital Forensics
- **File System**  
  - Identify deleted/modified files  
  - Spot attacker tools or payloads  

- **System Memory**  
  - Capture RAM to find in-memory malware or credentials  
  - Useful when malicious code never touches disk  

- **System Logs**  
  - Review OS, application, and security logs to trace attacker actions  
  - Pinpoint entry points and lateral movement  

- **Network Logs**  
  - Analyze firewall, proxy, and IDS logs to follow attacker network paths  

### Attack Classification
- **Full Breach**: Attacker achieved their goal (data theft, ransomware, etc.).  
- **Partial Breach**: Attack reached inside but was stopped before doing major damage.  
- **Attempt**: Attack tried to break in but failed completely.

---

## Incident Response Steps

1. **Preparation**  
   - Train staff  
   - Create playbooks and communication plans  

2. **Detection & Analysis**  
   - Spot the incident via alerts or reports  
   - Determine scope and impact  

3. **Containment, Eradication & Recovery**  
   - Isolate affected systems or networks  
   - Remove malware, close vulnerabilities  
   - Restore services and validate integrity  
   - Update defenses based on lessons learned  

4. **Post-Incident Review**  
   - Write a detailed report  
   - Analyze root causes  
   - Update defenses and procedures to prevent repeat attacks

---

## Malware Types

- **Virus**  
  Self-replicating code that attaches to programs and spreads to other machines.

- **Trojan Horse**  
  Malicious software disguised as legitimate; lets attackers control your system.

- **Ransomware**  
  Encrypts files and demands payment for the decryption key.

---

## Hands-On Exercise

- **SIEM Practice**: Found a known malicious IP in our SIEM alerts and blocked it at the firewall.
