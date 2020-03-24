# What is EC2 ?

- Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides resizable compute capacity in the cloud. Amazon EC2 reduces the time required to obtain and boot new server instances to minutes, allowing you to quickly scale capacity, both up and down, as your computing requirements change.
- It is just Virtual Machine in cloud.
- EC2 has changes the economics of computing by allowing you to pay only for capcity that you actually use. (Rather than setting up inhouse servers)
- Amazon EC2 provides developers the tools to build failure resilient applications and isolate themselves from common failure scenarios.

---

# EC2 Oprtions

- On Demand : Allows you to pay a fixed rate by the hour (or by the second) with no commitments. [Linux instances are by seconds, Windows instances are by hour]

- Reserved : Provides you with a capacity reservation, and offer a significant discount on the hourly charge for an instance. 1 Year or 3 Year Terms.

- Spot : Enables you to bid whatever price you want for instance capacity, providing for even greater savings if your applications have flexible start and end times. [think like stock market]

- Dedicated hosts : Physical EC2 Server dedicated for your use. Dedicated Hosts can help you reduce costs by allowing you to use your existing server-bound software licenses.

---

# On Demand

- Perfect for users that want the low cost and flexibility of Amazon EC2 without any up-front payment or long-term commitment.
- Applications with short term, spiky or unpredictable workloads that cannot be interrupted.
- Applications being developed or tested on Amazon EC2 for the first time.

---

# Reserved Instances (RIs)

- Applications with steady state or predictable usage
- Applications that require reserved capacity
- Users can make up-front payments to reduce their total computing costs even further ex -
  - Standard RIs (Up to 75% off on-demand)
  - Convertible RIs (Up to 54% off on-demand) feature the capability to change the attributes of the RIs as long as the exchange results in the creation of Reserved Instances of equal or greater value.
  - Scheduled RIs are avaliable to launch within the time window you reserve. This option allows you to match your capacity reservation to a predictable recurring schedule that only requires a fraction of a day, a week, or a month.

---

# Spot Instances

- Applications that have flexible start and end times.
- Applications that are only feasible at very low compute prices.
- Users with an urgent need for large amounts of additional computing capacity.

---

# Dedicated Hosts

- Useful for regulatory requirements that may not support multi-tenant virtualization.
- Great for licensing which does not support multi-tenancy or cloud deployments.
- Can be purchased On-Demand (hourly).
- Can be purchased as a Reservation for up to 70% off the On-Demand price.

---

# What is EBS ?

- Amazon EC2 is virtual server in the cloud, Amazon EBS is Virtual disk
- EBS : Elastic Block Storage
- Amazon EBS allows you to create storage volumes and attach them to Amazon EC2 Instances.
- Once attached, you can create a file system on top of these volumes, run a database, or use them in any other way you would use a block device.
- Amazon EBS volumes are placed in a specific availability zone, where they are automatically replicated to protect you from the failure of a single component.
- EBS Volume Types :
  - General Purpose SSD (GP2)
    - General purpose, balance both price and performance.
    - Ratio of 3 IOPS per GB with upto 10,000 IOPS and the ability to burst up to 3000 IOPS for extended periods of time for volumes at 3334 GiB and above.
  - Provisioned IOPS SSD (I01)
    - Designed for I/O intensive applications such as large relational or NoSQL databases.
    - Used if you need more than 10,000 IOPS.
    - Can provision up to 20,000 IOPS per volume.
  - Throughput Optimized HDD (ST1)
    - Big data
    - Data warehouses.
    - Log processing
    - Cannot be a boot volume
  - Cold HDD (SC1)
    - Lowest Cost Storage for infrequently accessed workloads
    - File Server
    - Cannot be a boot volume
  - Magnetic (Standard)
    - Lowest cost per gigabyte of all EBS volume types that is bootable.
    - Magnetic volumes are ideal for workloads where data is accessed infrequently, and applications where the lowest storage cost is important.

---

NOTE :

- If a spot instance is terminated by Amazon EC2, you will not be charged for a partial hour of usage. However, if you terminate the instance yourself, you will be charged for the complete hour in which the instance ran.
- Remeber : FIGHT DR MC PX

---

# Load Balancer

- Load balancing is the process of distributing network traffic across multiple servers.
- This ensures no single server bears too much demand. By spreading the work evenly, load balancing improves application responsiveness.
- It also increases availability of applications and websites for users.
- software load balancers have added additional capabilities including security and application.
- the load balancer decides which servers can handle that traffic.
- Load balancers manage the flow of information between the server and an endpoint device (PC, laptop, tablet or smartphone). The server could be on-premises, in a data center or the public cloud.
- Load balancers conduct continuous health checks on servers to ensure they can handle requests. If necessary, the load balancer removes unhealthy servers from the pool until they are restored.
- Load balancing can do more than just act as a network traffic cop, Software load balancers provide benefits like predictive analytics that determine traffic bottlenecks before they happen.
- Load Balancing Algorithms :
  - Least Connection Method — directs traffic to the server with the fewest active connections. Most useful when there are a large number of persistent connections in the traffic unevenly distributed between the servers.
  - Least Response Time Method — directs traffic to the server with the fewest active connections and the lowest average response time.
  - Round Robin Method — rotates servers by directing traffic to the first available server and then moves that server to the bottom of the queue. Most useful when servers are of equal specification and there are not many persistent connections.
  - IP Hash — the IP address of the client determines which server receives the request.
- Different types of Load Balancer are : SDN (s/w defined networking), UDP (user datagram protocol), TCP, SLB, virtual, Elastic, Geographic, Mulit-site, Load balancer as a service, etc

---

# Elastic Load Balancer :

- Types of Load balancer :
  - Application Load Balancer (Load balancer can control/configure upto OSI-7 Application Layer)
  - Network Load Balancer (OSI-4 Network Layer)
  - Classic Load Balancer (Legacy load balancer)
- Application Load Balancer : are best suited for load balancing of Http and Https traffic. They operate at Layer-7 of OSI and are application aware. They are intelligent and you can create advance request routing, sending specified request to specific web servers.
- Network Load Balancr :are best suited for load balancing of TCP taffic where extreme performance is required. Operating at Layer-4 connection level, Network layers are capable of handling millions of request per second, while maintaining ultra-low latencies. It is used for exteme performance.
- Classic Load Balancer : are the legacy Elastic load balancer. You can load balance HTTP/HTTPs applications and it uses OSI layer-7, such as a X-Forwarded and sticky sessions. You can also use strict layer 4 load balancing for applications that rely purely on TCP protocol.
- Load Balancer Error :
  - Classic Load Balancers- if your application stop responding, the ELB(Classic Load Balancer) responds with 504 Error. This means that the application is having issue. This could be either at web-server layer or the DB Layer. ERROR 504
- When a Client(124.25.53.1) hits the load balancer suppose 10.0.0.23 -> now load balancer intenal hits the web sever 10.0.0.23, but we have a use-case whee we want to know to the client who had made the requst. This can be achived via - X-Forwarded-For (124.25.53.1)

---

EXAM Tips :

- 504 Error Means the gateway had timeout. This means that the application not responding within the idle timeout period. To troubleshoot this issue : Debug your Web-serer or your DB Server
- If you need the Ip4 Address of your end user, Look for the X-Forwarded-For Header.

---

COMPLETE EXAM TIPS :

- On Demand - allow you to pay a fixed rate by hour (or by the second) with no commitment.
- Reserved - provides you with a capacity reservation, and offer a significant discount on the hourly charge for an instance. 1 year or 3 year terms
- Spot - enables you to bid whatever price you want for instance capacity, providing for even greater savings if your applications have flexible start and end times.
- Dedicated Hosts - Physical EC2 server dedicated for your use. Dedicated Hosts can help you redice costs by allowing you to use your exisiting server-bound software licenses.
- If a spot instnace is terminated by Amazon EC2, you will not be charged for a particular hour of usage. However, if you terminate the instance yourself, you will be charged for the complete hour in which the instance ran.
- FIGHT DR MC PX!
- SSD
  - General purpose SSD: balance price and performance for a wide varitey of workloads.
  - Provisioned IOPS SSD: Highest-performance SSD voulme for mission-critical low-latency or high-throuput workloads.
- Magentic
  - Throughput Optimized HDD: Low cost HDD volume designed for frequently accessed, throughput-intensive workloads.
  - Cold HDD: Lowset cost HDD volumen designed for less frequently accessed workloads
  - Magentic: Previous Generation. Can be a boot volumne.
- 3 Types of Load Balancer (elb- elastic load balancer)
  - Application load Balancer
  - Network Load Balancer
  - Classic Load Balancer
- 504 Error means the gateway has timed out. This means that the application not responding within the idle timeout period.
  - trobule shoot the application not. Is it the web server or db server ?
- If you need th Ipv4 address of you end user, look for the X-Forwaded-For header.
- Route 53 is amazons DNS Service
- Allows you to map your domanin names to
  - EC2 Instances
  - Load balancers
  - S3 buckets
- Least Privilege: Always give your users the minimum amount of access required.
- Create Groups: Assign your users to groups. Your users will automatically inherit the permissions of the groups. The groups permissions are assigned using policy documents.
- Secret Access Key: You will see this only once. If you do not save it, you can delete the Key Pair (Access Key ID and Secret Access Key) and regenerate it. You will need to run aws configure again.
- Do not use just once access key: Do not create just one access key and share that with all your developers. If someone leaves the company on bad terms, then you will need to delete the key and create a new one and every developer would then need to update their keys. Instead create one key pair per developer.
- You can use the CLI on your PC: you can install the CLI on your MAC, Linux or PC. I should use S3 to store all my files up in the cloud.
- Roles allow you to not use Access Key ID's and Secret Access Keys
- Roles are perferred from a security perspective.
- Roles are controlled by policies.
- You can change a policy on a role and it will take immediate affect
- You can attach and detach roles to running EC2 instances without having to stop or terminate these instances.
- You can encrypt the root device volume (the volume the OS is installed on) using OS level encryption.
- You can encrypt the root device volume by first taking a snapshot of that volume, and then creating a copy of that snap with encryption. You can then make an AMI of this snap and deploy the encrypted root device volumne.
- You can encrypt additional attached volumes using the console, CLI or API
- RDS : OLTP (Online transaction processing)
  - SQL
    - MySQL
    - PostgresSQL
    - Oracle
    - Aurora
    - MariaDB
  - NoSQL
    - DynamoDB
- Redshift : OLAP (Online Analytical Processing) [Dataware housing service]
- Elasticcache - In Memeory Caching
  - Memcached
  - Redis
- Multi-AZ is for Disaster Recovery only. It is not primarly used for improving performance. For performance improvement you need Read Replicas.
- Read Replica DB
  - Used for scaling, not for disaster Management
  - Must have automatic backups turned on in order to deply a read replica.
  - You can have up to 5 read replica copies of any db's.
  - You can have read replicas of read replicas (but watch out for latency).
  - Each read replica will have it own DNS endpoint.
  - You can have read replicas that have Mult-AZ.
  - You can create read replicas of Multi-AX source db's.
  - Read replicas can be promoted to be their own db's. This breaks the replication.
- You can have a read replica in a second region (for MySQL and MariaDB)
- Typically, you will be given a scenario where a particular db is under stress/load. You may be asked which service you should use to alleivate this. (Elasticache if your db is read-heavy)
- Elasticache is good choice if your db is particularly read-heavy and not prone to frequent changing.
- Redshift is a good answer if the reason your db is feeling stress bcoz - Management keep running OLAP transactions on it etc.
- Use Memcached if
  - Object caching is your primary goal
  - You want to keep things as simple as possible.
  - You want to scale your cahce horizontally (scale out)
- Use Redis if
  - You have advanced data types, such as lists, hashes and sets
  - You are doing data sorting and ranking (such as leader-boards)
  - Data perisitence
  - Multi AZ
  - Pub/Sub capabilites are needed.
