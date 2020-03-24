# Elasticache

- ElastiCache is a web service that makes it easy to deploy, operate and scale an in-memory cache in the cloud.
- The service improves the performance of web applications by allowing you to retrieve information from fast, managed, in-memory caches, instead of relying entierly on slower disk-based db.
- Mainly used for read operation.
- Amazon ElastiCache can be used to significantly improve latency and throughput for many read-heavy application workloads (such as social networking, gaming, media sharing and Q&A portals) or compute-intensive workloads (such as recommendation engine)
- Caching improves application performance by storing critical pieces of data in memory for low-latency access. Cached information may include the reults of I/O-intensive db queries or the result of computationally-intensive calcuations.

- Types of ElastiCache:

  - Memcached (Spell :- Memcache-Dee)
  - Redis

- Memcached : a widely adopted memory object caching system. ElastiCache is protocol compliant with memcached, so popular tools that you use today with exisiting Memcached environments will work seamlessly with the service. Ex: Mangento website used memcached

- Redis : A popular open-source in memory key-value store that supports data structures such as sorted sets and lists. ElastiCache supports Master/Slave replication and Mutli-AZ which can be used to achieve cross AZ(Avaliablity Zone) redundancy.

- Although both memcached and redis apper similar on the surface (in that they are both in-memory key stores), they are actually quite different in practice.

- Because of the replication and peristence feature of Redis, ElastiCache manages redis more as a relation db.
- Redis ElastiCache clusters are managed as stateful entities that include failover, similar to how Amazon RDS manages db failover.

- Because memcached is desinged as a pure caching solution with no perisitence, ElastiCache manages Memcached nodes as pool that can grow and shrink, similar to Amazon EC2 Auto Scaling Group.
- Individual nodes are expendable, and ElastiCache provides additional capabilites here, such as automatic node replacement and auto discovery.

---

# Memcached- Use Cases

- Is object caching your primary goal, for example to offload your db ? If so use Memcached
- Are you interested in as simple a caching model as possible ? then use Memcached
- Are you planning on running large cache nodes, and require multi-threaded performance with utilization of multiple cores? then use Memcached.
- Do you want the ability to scale your cache horizontally as you grow? If so, use Memcached

---

# Redis - Use Cases

- Are you looking for more advanced data types, such as lists, hashes and sets ? the use Redis
- Does sorting and ranking datasets in memory help you, such as with leaderboards ? then use Redis
- Is persistence of your key store important ? then use Redis
- Do you want to run in multiple AWS Avaliability Zones (Multi-AZ) with failover ? then use Redis

---

# EXAM TIP:

- Typically, ou will be given a scenario where a particular db is under a lot of stree/load. You may be asked which service you should use to alleviate this. ==> Ans : Elasticache (if it is dataware housing question then go for ==> Redshift)
- Elasticache is a good choice if your db is particularly read-heavy and not prone to frequent changing.
- Redshift is a good answer if the reason your db is feeling stress is because management keep running OLAP transactions on it etc.
- Use Memcached if
  - Object caching is your primary goal
  - You want to keep things as simple as possible
  - YOu want to scale your cache horizontally (scale out)
- Use Redis if
  - You have advanced data types, such as lists, hashes and sets
  - You are doing data sorting and ranking (such as leader boards)
  - Data persistence
  - Multi-AZ
  - Pub/Sub capabilities are needed
