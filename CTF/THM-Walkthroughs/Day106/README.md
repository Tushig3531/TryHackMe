## Day 106
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Splunk: Dashboards and Reports**](https://tryhackme.com/room/splunkdashboardsandreports)

---

> Today, I am learning splunk.
### Scheduled Reports

In Splunk we can add scheduled reports, which lets us see a summary within a time range.

To do that:
1. First we search for what we want to see
2. Save that search as a report
3. Edit the schedule and other settings
4. We can find saved reports in the Reports section

### Alerts

We can also turn a search into an alert.

1. Write the alert query, for example: these IPs occurred, or this many 404 status codes happened, within a certain time span or threshold
2. Save the report as an alert
3. Choose the alert type, "Real-Time" or scheduled, and how it triggers, "Per-Result" etc
4. Set where the alert should be sent

### Enterprise Security (ES)

- Plain Splunk just lets you search logs and build dashboards. ES adds a layer of security specific thinking on top of that
- It maps what it sees to MITRE ATT&CK, so instead of "weird login at 3am" it can say "this looks like credential access, tactic X"
- It also gives a risk score
- Basically ES gives you a ranked list of things you should actually look at

### UEBA (User and Entity Behavior Analytics)

- This is a tool within ES
- Its purpose is watching behavior, not just a single event
- Example: catches a user suddenly accessing a file they never touched before

### SOAR

- Does response actions automatically using playbooks
---

<!-- ![Badge](badge-1.png) -->