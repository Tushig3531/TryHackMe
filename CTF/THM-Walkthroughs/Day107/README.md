## Day 107
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Splunk: Data Manipulation**](https://tryhackme.com/room/splunkdatamanipulation)

---

> Today, I am learning splunk.

Before Splunk can search, it has to parse the raw data, turning it into structured events with timestamps, fields, and more.
 
- **Know your data format**: CSV, JSON, XML, raw text, etc. This tells Splunk how to read it correctly.
- **Sourcetype**: A label that tells Splunk what kind of data it is.
- **inputs.conf**: Found in `/opt/splunk/etc/system/`. Tells Splunk what to collect and from where.
  - Default configs are in `/opt/splunk/etc/system/default`. Don't edit them.
  - Custom configs go in `/opt/splunk/etc/system/local`. This is where our custom rules go.
- **props.conf**: Controls how the data gets parsed for a given source.
  - We can also use regex here to pull out specific fields like username or IP address.
- We can also do all of this on the Splunk UI instead of making changes by hand.
### transforms.conf
**Purpose**: Allows us to define data transformations and enrichments on indexed events.
 
Instead of just capturing a username, we can add more detail onto it:
```bash
[extract_username]
REGEX = User\s+(\S+)\s+logged
FORMAT = username::$1
```
 
### fields.conf
**Purpose**: Controls how Splunk handles fields, mainly around search performance and multivalue fields.
- Indexed fields are faster to search.
### indexes.conf
**Purpose**: Manages the configuration of indexes in Splunk, including storage, retention policies, and access control.
 
### outputs.conf
**Purpose**: Specifies the destination and settings for sending indexed data to various outputs, mainly to a remote Splunk instance or a third party.
 
---
 
**Stanza**: Defines how Splunk should handle a specific component of its configuration. Written with the value in `[ ]`.
 
**App**: On top of the default settings, there are a lot of additional apps developed for Splunk.
 
- **SEDCMD-cc**: A SED command setting with a name of our choosing. `cc` in this case.
- **SHOULD_LINEMERGE**: Instructs Splunk whether it should combine or break multiple lines into single events.
- **BREAK_ONLY_BEFORE**: Breaks into a new event before the term.
- **MUST_BREAK_AFTER**
---
 
### Basically
1. First, I write my `inputs.conf` to bring in my log.
2. Second, if the parsing went wrong or I want it done differently, I use `props.conf`. Handles timestamps, line breaking, and simple field extractions.
3. Third, if I want the extraction to be more complex or reusable, I use `transforms.conf`.
4. `fields.conf` doesn't extract anything, it just changes how a field acts afterward.

---

![Badge](badge.png)