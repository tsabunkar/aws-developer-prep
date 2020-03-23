# What is a relational Database ?

- RDS : Relational Database Service
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

---

# RDS Backups

- There are two different types of Backups for AWS:
  - Automated Backups
  - Database Snapshots

---

## Automated Backups

- Automated Backups allow you to recover your db to any point in time within a "retention period"
- The retention period can be b/w 1 and 35 days
- Automated Backups will take a full daily snapshot and will also store transactions logs throught the day.
- When you do a recovery, AWS will first choose the most recent daily backup, and then apply transaction logs relevant to that day. This allows you to do a point in time recovery down to a second, within the retention period.
- Automated backups are enabled by default.
- The backup data is stored in S3 and you get free storage space equal to the size of your db. So if you have RDS instance of 10GB, you will get 10GB worth of storage
- Backups are taken within a defined window.
- During the backup windows, storage I/O may be suspended while you data is being backed up and you may experience elevated latency.

---

## Snapshots

- DB Snapshots are done manually (i.e they are user initiated.) They are stored even after you delete the original RDS instance, unlike automated backups.

---

# Restoring Backups

- Whenever you restore either an Automatic Backup or a manual Snapshot, the restored version of the db will be a new RDS instance with a new DNS endpoint.

---

# Encryption

- Encryption at rest is supported for MySQL, Oracle, SQL Server, PostgresSQL, MariaDB & Aurora.
- Encryption is done using the AWS Key Managment Service (KMS) service.
- Once your RDS instance is encrypted, the data stored at rest in the underlying storage is encrypted, as are its automated backups, read replicas, and snapshots are all encrypted.
- At the present time, encrypting an exisiting DB instance is not supported. To use Amazon RDS encryption for an existing db, you must first create a snapshot, make a copy of that snapshot and encrypt the copy.

---

# RDS - Multi-AZ (Multi-Avaliablity Zone)

- Multi-AZ RDS : Allows you to have an extact copy of your production db in another avaliability zone. AWS handles the replication for you, so when your production db is written to, this write automatically be synchronized to the standby db.
- In the event of planned db maintaince, DB Instance failure, or an avaliablity zone failure, Amazon RDS will automatically fallover to the standby so that db operations can resume quickly without administrative intervention.
- Multi-AZ is for Disaster Recovery only.
- For Perfromance improvement you need read replica
- Multi-AZ db is avaliable for : Aurora, SQL Server, Oracle, MySQL Server, PostgreSQL, MariaDB

---

# RDS - Read Replicas

- Read replicas allow you to have a read-only copy of you production db.
- This is achieved by using Asynchronous replication from the primary RDS instance to the read replica
- You use read replicas primarily for very read-heavy db workload.
- Read replica db are avaliable for : MySQL, PostgressSQL, MariaDB, Aurora
- Read replica db is used for scaling, not for disaster recovery (or Disaster recovery use- Multi-AZ
- Must have automatic backups turned on in order to deploy a read replica.
- You can have up to 5 read replica copies of any db.
- You can have read replica of read replicas (but watch out for latency).
- Each read replica will have its own DNS end point.
- You can have read replicas that have Multi-AZ.
- You can create read replicas of Multi-AZ source db's.
- Read replicas can be promoted to be thier own db's. This breaks the replication.
- You can have a read replica in a second region.
