# S3

- S3 provides developers and IT teams with secure, durable, highly-scalable object storage(object sotrage -> files/images/web-pages).
- Amazon S3 is easy to use, with a simple web services interface to store and retrieve any amount of data from anywhere on the web.
- S3 is safe place to store your files.
- The data is spread across multiple devices and facilities. (Disaster recovery is already builtin amazon s3- faulty datacenter disaster is been taken care )
- S3 is Object-based - i.e: allows you to upload files.
- File can be from 0 bytes to 5 TB.
- There is unlimited storage.
- Files are stored in Buckets (similar to a folder)
- S3 is a universal namespace. That is, names must be unique globally.
- When you upload a file to S3, you will recive a HTTP 200 code if the upload was successful

---

# Data Consistency Model For S3

- Read after write consistency for PUTS of new Objects.
- Eventual Consistency for overwrite PUTS and DELETES (can take some time to propagate)

---

# S3 is a simple key-value store

- S3 is object based. Objects consist of the following:
  - Key (this is simply the name of the object)
  - Value (this is simply the data, which is made up of a sequence of bytes)
  - Version ID (Important for versioning)
  - Metadata (data about data you are storing)
  - Subresources- bucket-specific configuration:
    - Bucket Policies, Access Control Lists
    - CORS (Cross Origin Resource Sharing)
    - Transfer Acceleration

---

# S3 Basics

- Built for 99.99% availability for the S3 platform.
- Amazon Guarantee 99.9% availability
- Amazon guarantees 99.999999999% durability for S3 information (remeber 11 x 9s)
- Tiered Storage Available.
- Lifecycle Management.
- Versioning
- Encryption
- Secure your data -Access using Control Lists and bucket policies

---

# S3 - Storage Tiers/Classes

- S3:99.99% availability, 99.99999999% durability, stored redundantly across multiple devices in multiple facilites, and is designed to sustain the loss of 2 facilities concurrently.
- S3 - IA (Infrequently Accessed) : For data that is accessed less frequently, but requires rapid access when needed. Lower fee than Standard S3, but are charged a retrieval fee.
- S3 - One Zone IA: Same as IA however data is stored in a single availability zone only, still 99.999999999% durability, but only 99.5% availability. Cost is 20% less than regular s3- IA.
- Reduced Redundancy Storage: Designed to provide 99.99% durability and 99.99% availability of objects over a given year. Used for data that can be recreated if lost, ex- thumbnails. (Starting to disapper from AWS doc's but many still feature in exam)
- Glacier: Very cheap, but used for archival only. Optimised for data that is infrequently accessed and it takes 3-5 hours to restore from Glacier.
- S3 Intelligent Tiering :
  - Unknown or unpredictable access patterns
  - 2 tiers- frequent and infrequent access
  - Automatically moves your data to most cost-effective tier based on how frequently you access each object (30days time period, if not accessed in this time period then it be categroized as infrequently accessed files)
  - 99.999999999% durability.
  - 99.9 availability over a given year.
  - Optimizes cost
  - No fees for accessing your data but a small monthly fee for monitoring/automation \$0.0025 per GB

---

# S3 Charges

- Charged for :
  - Storage per GB
  - Request (Get, Put, Copy, etc)
  - Storage Management Pricing
    - Inventory, Analytics, and Object Tags
  - Data Management Pricing
    - Data transferred out of s3
  - Transfer Acceleration
    - Use of Cloudfront to optimize transfers

---

# Exam Tips:

- Remember that S3 Objects-based: i.e- allows you to upload files. Object-based storage only (for files).
- Not sutable to install an O.S or running a db on it.
- Files can be from 0 bytes to 5 TB.
- There is unlimited storage.
- Files are stored in buckets.
- S3 is a universal namespace. That is, names must be unique globally
- Read after write consistency for PUTS of new Objects
- Eventual Consistency for overwrite PUTS and DELETES (can take some time to propagate).
- S3 Storage Classes/Tiers :
  - S3 (durable, immediately available, frequently accessed)
  - S3 - IA (durable, immediately available, infrequently accessed)
  - S3 - One Zone IA: Same as IA. However, data is stored in a single availability zone only.
  - S3 - Reduced Redundancy Storage ( Data that is easily reproducible, such as thumbnails, etc)
  - Glacier - Archived data, where you can wait for 3-5 hours before accessing.
- Remeber the core fundamentals of an S3 object:
  - Key (name)
  - Value (data)
  - Version ID
  - Metadata
  - Subresources -bucket-specific configuration:
    - Bucket Policie, Accesss Control Lists
    - CORS
    - Transfer Acceleration
- Successful uploads will generate a HTTP 200 status code - when you use the CLI or API
- Make sue you read the S3 FAQ: https://aws.amazon.com/s3/faqs
