# What is a relational Database ?

- Relational DB are what most of us are all used to. They have been around since the 70's. Think of a traditional spreadhseet :
  - Database
  - Tables
  - Row
  - Fields (Columns)
- Different Relational DB with AWS Services
  - SQL Server
  - Oracle
  - MySQL
  - PostgresSQL
  - MariaDB
  - Amazon Aurora
- Non-relational DB : is a db we have - Collection (Table), Document (Row), Key value pairs (fields)
- ex : {
  "\_id" : "51674r4979",
  "firstname" : "tejas",
  "age" : "23"
  }

---

# Data warehousing

- Used for business intelligence. Tools like Cognos, Jaspersoft, SQL Server Reporting Services, Oracle Hyperion and SQP NetWeaver.
- Used to pull in very large and complex data sets. Usually used by management to do queries on data (such as current performance vs targets, etc)
- It used for reporting and analytics of your DB and performance
- It will not be run production db, rather separate data warehouse db

---

# OLTP vs OLAP

- OLTP (Online Transaction Processing) differs from OLAP (Online Analytics Processing) in terms of the types of queries you will run.
- OLTP Example: Order number 210201 (what does it do -> pulls up a row of data such as Name, Date, Address to deliever to, Delivery Status, etc )
- OLAP Transaction example : Net profit for EMEA and Pacific for the digital radio product. Pulls in large number of records, Sum of radios sold in EMEA/Pacific, Unit of cost of radio each region, sale price of each radio, sale price- unit cost.
- Data warehousing db use different type of architecture both from a db perspective and infrastructure layer.

---

# Elasticache

- Elasticache is a web service that makes it easy to deploy, operate and scale an in-memory cache in the cloud. The service improves the performance of web applications by allowing you to retrieve information from fast, managed, in-memory caches, instead fo relying entierly on slower disk-based db.
- Elasticache supports two open-source in-memory caching engines:
  - Memcached
  - Redis
- Typical cache the data which are frequently called/used by most of the users - Think like : like top 10 books in the shelves, etc
- Makes DB transaction much faster

---

# Summary :

- RDS is an - OLTP (Online Transaction Processing)
  - SQL (PostgresSQL, MySQL, Oracle, Aurora, etc)
  - NoSQL (Dynamo DB)
- Redshift is an - OLAP (Online Analytics Processing) [used for bigdata, Businnes intelligence (B.I)]
- Elasticache - In Memory Caching (memcahced, redis)
