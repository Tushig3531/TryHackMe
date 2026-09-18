## Day 109
### [**Streak**](https://tryhackme.com/Tushig3531/streak)
---
**Room Completed**
[**Elastic: Setting up a SOC Lab**](https://tryhackme.com/room/elasticlab)

---

> Today, I am learning Elastic.
### Stack Components

- **Elasticsearch** : core search engine and data store. It indexes and stores data, enabling quick searching, filtering, and aggregation. By default, listens on TCP 9200 for HTTP based API access
- **Kibana** : graphical user interface of the Elastic Stack. Accessed over port 5601 using a web browser. It does not store data itself, instead it communicates with Elasticsearch over port 9200 to retrieve and visualize data
- **Elastic Agent** : lightweight host based service installed on individual systems to collect and forward data to Elastic
- **Fleet Server** : allows SOC teams to deploy agents, assign policies, configure integrations, and manage data collection across many hosts from a single location
- **Integrations** : allow for easy ingestion of logs and metrics
- **Beats** : lightweight data shippers designed to collect specific types of log data
- **Logstash** : used to ingest, parse, and transform data before it is indexed

### How it fits together

Data is collected from endpoints and servers by Elastic Agents, managed centrally through Fleet Server. That data is then ingested and indexed into Elasticsearch, making it searchable and available for analysis. Analysts interact with the data through Kibana.

### Integrations

- An integration brings in logs and also adds additional extension formats
- Integrations are settings applied to an agent policy that define what data gets collected
- Elastic offers many built in integrations, installed through a Fleet Agent or a Beat
- Example: the Apache HTTP Server integration collects Apache access and error logs
- The integration must be applied to the correct agent policy, so the right host sends its data

The rest of the ideas were similar to Splunk.

---

<!-- ![Badge](badge.png) -->