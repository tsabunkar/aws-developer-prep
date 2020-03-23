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
