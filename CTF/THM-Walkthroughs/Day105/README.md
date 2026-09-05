## Day 105
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Splunk: Setting up a SOC lab**](https://tryhackme.com/room/splunklab)

---

> Today, I am learning splunk.
### Architecture

In Splunk architecture there are 4 main components:

- **Forwarder** : small agent installed on the machine, ships raw data
  - Universal forwarder just sends raw
  - Heavy forwarder parses or filters before shipping, so less junk arrives
- **Indexer** : receives the data, breaks it into events, stores them in indexes. This makes it searchable
- **Search Head** : the web UI we actually use. We query, it searches the indexes and shows results
- **Deployment Server** : optional. In large orgs you have hundreds of forwarders. This is the central place to configure and update all of them, so we don't log into each machine one by one

In my lab, the indexer and search head are the same instance. In real environments they are separate hosts.

### Search time vs index time parsing

Splunk stores the log line exactly as it came in, and does the parsing when we search. So even if I wrote wrong rules it doesn't ruin anything, I can fix the rule and old data works again. But it costs more CPU on every search.

Elastic parses upfront, which makes queries faster, but changing the parsing means reindexing.

### CLI commands

> Run from the Splunk bin folder

| Command | What it does |
|---|---|
| `./splunk start` | starts |
| `./splunk stop` | stops |
| `./splunk restart` | restart |
| `./splunk status` | checks status |
| `./splunk enable boot-start` | starts automatically when server boots |
| `./splunk add oneshot /path/to/file -index NAME` | one time upload of a single file into that index |
| `./splunk search "query"` | search from CLI |
| `./splunk help` | available commands |

### Setup steps

**On the Splunk server:**
1. Settings > Forwarding and receiving > Configure receiving, add the receiving port (9997)
2. Settings > Indexes, create the index and name it

**On the forwarder machine:**
3. Point it at the server
   `./splunk add forward-server SERVER_IP:9997`
4. Pick what logs to ship
   `./splunk add monitor /path/to/logs -index my_index`

Check what is being monitored:
`/opt/splunkforwarder/etc/apps/search/local/inputs.conf`

**On Windows** it is basically the same:
`.\splunk.exe add monitor C:\Windows\System32\winevt\Logs\Security.evtx`

**To turn a Splunk instance into a deployment server:**
`./splunk enable deploy-server`


---

<!-- ![Badge](badge-1.png) -->