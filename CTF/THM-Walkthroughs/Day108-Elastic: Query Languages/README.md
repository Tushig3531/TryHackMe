## Day 108
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Elastic: Query Languages**](https://tryhackme.com/room/advancedelkqueries)

---

> Today, I am learning Elastic.

### Query Languages

**Lucene** : query syntax built on the Apache Lucene library, the core search engine underlying Elasticsearch. It supports advanced search capabilities like pattern matching and positional queries.

**Kibana Query Language (KQL)** : simpler, user friendly, specifically for Kibana.

**Elasticsearch Query Language (ES|QL)** : newer, pipe based query language. It allows us to filter, transform, and aggregate data using a sequential pipeline syntax, making complex queries easy to read and write. Kind of similar to Splunk SPL (Search Processing Language).

### Lucene syntax notes

- `\` backslash : similar to `$` in Python, tells the system to treat the next special character as normal text instead of a command
- When a field contains structured objects instead of plain text, you can drill into specific attributes using `field.subfield` syntax, which lets you filter much more precisely
- Regex in Lucene must be wrapped in forward slashes `/pattern/`
- `.` in Lucene regex : (double check this one, need to confirm exact meaning)

### Fuzzy search (Lucene)

Allows finding terms that are similar but not identical, by specifying how many character differences are allowed between the search term and the stored value.

- `~` is the fuzzy operator
- `server01~1` allows 1 character difference, would match `server01` and `serber01`

### Slop parameter

Also uses `~`, but lets us find documents whose field values contain two or more terms within a specified distance of each other.

- `log_message: "server error"~1` allows up to one position away, would match `"Server error: failed login attempt"` and `"Server: Detected error in connection"`

### Elastic Common Schema (ECS)

A standard naming system for log fields, so different data sources use the same field names for the same type of information. Instead of guessing different field names per source, we search one consistent field name, like `source.ip`.

### Event Query Language (EQL)

Built specifically for security investigations. Its main strength is connecting events together instead of just finding single matching records.

Example: instead of searching for one login event, EQL can look for a pattern, like a file rename or creation happening to sensitive cron files on Linux:

```bash
file where host.os.type == "linux" and
 event.action in ("rename", "creation") and
 file.path in (
   "/etc/crontab",
   "/etc/cron.allow",
   "/etc/cron.deny"
 )
```

---

<!-- ![Badge](badge.png) -->