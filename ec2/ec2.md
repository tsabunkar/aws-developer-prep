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
