## Day 104
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Report Writing for SOC L2**](https://tryhackme.com/room/reportwritingsocl2)

---

> Today, I am learning splunk.

## 1. Filtering by time

To filter the alerts between dates, we use:
- `earliest="..."` : to set the start date
- `latest="..."` : to set the end date

```spl
index = windowslogs earliest="04/15/2022:08:05:00" latest="04/15/2022:08:06:00"
```

## 2. Wildcards and subnets

| Symbol | Example | Explanation |
| --- | --- | --- |
| `*` | `status=*fail*` | Returns all events where the status field is set to failed, failure, appfail, etc. |
| `*` | `DestinationIp=172.*` | Returns all events containing values like `DestinationIp=172.90.0.0.1` or `DestinationIp=172.18.5.22` |
| N/A | `DestinationIp=172.18.0.0/16` | Returns all events where the DestinationIp field falls within the 172.18.0.0/16 subnet |

---

## 3. Filtering

**Choosing what to see**

| Command | What it does |
| --- | --- |
| `fields` | It basically filters what you want to see. Basically keep only what I name.<br>• `+` : adds those fields in your view<br>• `-` : remove those fields and you can see everything except those |
| `dedup` | Removes the duplicates |
| `rename` | Renames the field |
| `regex` | Filter search results using regular expressions. It is best for following a specific format rather than a keyword |
| `table` | Creates table the fields I have selected |

**Ordering and slicing**

| Command | What it does |
| --- | --- |
| `_time` | Sorts them in time, which can be useful when I am tracing through time table |
| `head` | New events |
| `tail` | Last events |
| `sort` | Sorts based on alphabetic or numeric |
| `reverse` | Reverses the order |
| `join` | When I need to do investigate from different fields, and merge them to get my wanted events |

**Finding patterns**

| Command | What it does |
| --- | --- |
| `top` | Most frequent values |
| `rare` | Gives me least frequent values |
| `highlight` | Highlights the chosen field from the raw data |

**Calculating**

`stats` — do calculation for me:
- average : `stats avg(...)`
- max : `stats max(...)`
- min : `stats min(...)`
- sum : `stats sum(...)`
- count : `stats count by ...`

**Visualizing and enriching**

| Command | What it does |
| --- | --- |
| `chart` | Same as stats, but on visual form |
| `timechart` | It creates a chart, but we should add span. So it will help us to give on what time, the value was the most frequent or not |
| `iplocation` | Tells us what country, city, location the IP is from |
| `lookup` | How I glue outside information onto your events |
| `eval` | It creates a new field based on our desire |

---

<!-- ![Badge](badge-1.png) -->