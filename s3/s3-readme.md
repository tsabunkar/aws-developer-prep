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

---

# Securing Your Buckets

- By default, all newly created buckets are PRIVATE.
- You can set up access control to your buckets using:
  - Bucket Policies - Applied at an object level.
  - Access Control Lists - Applied at an object level.
- S3 buckets can be configured to create access logs, which log all requests made to the S3 bucket. These logs can be written to another bucket.

---

# S3 Encryption

- In Transit
  - SSL/TLS
- Encryption at Rest:
  - Server Side Encryption
    - S3 Managed Keys -> SSE-S3 (AWS is manageing your keys/encryption)
    - AWS key Management Service, Managed Keys, SSE-KMS
    - Server Side Encryption with customer Provided Keys -> SSE-C (Your manageing the keys)
  - Client Side Encryption (we encrypt our files before uploading to S3)
- Enforcing Encryption on S3 buckets
  - Every time a file is uploaded to S3, a PUT request is initiated.
  - This is what PUT request looks like:
    - PUT /myFile HTTP/1.1
      Host: myBucket.s3.am...
      Date: Wed,..
      Authorization: authorization string
      Content-Type: text/plain
      Content-Length: 27364
      x-amzz-meta-author: Faye
      Except: 100-continue
- If the file is to be encrypted at upload time, the x-amz-server-side-encryption parameter will be included in the request header.
- Two options are currently avaliable:
  - x-amz-server-side-encryption: AES256 (SSE-S3 - S3 Managed keys)
  - x-amz-server-side-encryption: ams-kms (SSE-KMS - KMS Managed keys)
- When this parameter is included in the header of the PUT request, it tells S3 to encrypt the object at the time of upload, using the specified encryption method.
- You can enforce the use of Server Side Encryption by using a Bucket Policy which denies any S3 PUT request which doesn't include the x-amz-server-side-encryption parameter in the request header.
- The following request tells S3 to encrypt the file using SSE-S3 (AES 256) at the time of upload:
  - PUT /myFile HTTP/1.1
    Host: myBucket.s3.am...
    Date: Wed,..
    Authorization: authorization string
    Content-Type: text/plain
    Content-Length: 27364
    x-amzz-meta-author: Faye
    Except: 100-continue
    x-amz-server-side-encryption: AES256

---

# EXAM TIPS S3 Encryption

- Two S3 Encryption
  - Encryption In-Transit
  - Encryption at Rest
- Encryption In-Transit
  - SSL/TLS (HTTPS)
- Encryption At Rest
  - Server Side Encryption
    - SSE-S3
    - SSE-KMS
    - SSE-C
  - Client Side Encryption
- If you want to enforce the use of encryption for your files stored in S3, use an S3 Bucket Policy to deny all PUT requests that don't include the x-amz-server-side-encryption parameter in the request header.

---

# S3 Performance Optimization

- S3 is designed to support very high request rates. However, if your S3 buckets are routinely receiving > 100 PUT / LIST / DELETE or > 300 GET request per second, then there are some best practice guidelines that will help optimize S3 performance.
- The guidance is basd on the type of workload you are running:
  - GET-Intensive Workloads:
    - use cloudfront content delivery service to get best performance. cloudfront will cache your most frequently accessed objects and will reduce latency for your GET requests.
  - Mixed Request Type Workloads:
    - A mix of GET, PUT, DELETE, GET Bucket - the key names you use for your objects can impact performance for intensive workloads
    - S3 uses the key name to determine which partition an object will be stored in
    - The use of sequential key names ex: names prefixed with a time stamp or alphabetical sequence increase the likelihood of having multiple objects stored on the same partition.
    - For heavy workloads this can cause I/O issues and contention
    - By using a random prefix to key names, you can force S3 to distribute your keys across multiple partitions, distributing the I/O workload.

# Exam Tips for S3 Performance Optimization

- Remeber the 2 main approaches to Performance Optimization for S3:
  - GET-Intensive Workloads : Use CloudFront
  - Mixed-Workloads : Avoid sequential key names for your S3 Objects. Instead, add a random prefix like a hex hash to the key name to prevent multiple objects from being stored on the same partition. (./s3key-names.png)
- In July 2018, Amazon announced a massive increase in S3 performance
  - request now supported
    - 3500 put requests per second
    - 5500 get requests per second
  - This new increased performance negates the previous guidance to randomize your object keynames to achieve faster performance.
  - This meands logical and sequential naming patterns can now be used without any performance implication.

---

# S3 Summary

- Remember that S3 is Object-based: i.e. allows you to upload files.
- Files can be from 0 Bytes to 5 TB
- There is unlimited storage.
- Files are stored in Buckets.
- S3 is a UNIVERSAL NAMESPACE. That is, names must be UNIQUE globally.
- Read after Write consistency for PUTS of new Objects.
- Eventual Consistency for overwrite PUTS and DELETES (can take some time to propagate)
- S3 Storage Classes/Tiers
  - S3 (durable, immediately available, frequently accessed)
  - S3 - IA (durable, immediately available, infrequently accessed)
  - S3 - One Zone IA: Same as IA. However, data is stored in a single Avaliability Zone only.
  - S3 - Reduced Redundancy Storage (data that is easily reproducible, such as thumbnails, etc)
  - Glacier - Archived data, where you can wait 3-5 hours before accessing.
- Remeber the core fundametnals of an S3 object:
  - Key (name)
  - Value (data)
  - Version ID
  - Metadata
  - Subresources (used to manage bucket-specific configuration)
    - Bucket Policies, ACLs
    - CORS
    - Transfer Acceleration
- NOTE about S3:
  - S3 is object-based storage only (for files)
  - Not suitable to install an operating system on
  - Successful uploads will generate a HTTP 200 status code.
- Security:
  - By default, all newly created buckets are PRIVATE.
  - You can set up access control to your buckets using:
    - Bucket Policies : Applied at a bucket level.
    - Access Control Lists : Applied at an object level,
  - S3 buckets can be configured to create access logs, which log all requests made to the S3 bucket. These logs can be written to another bucket.
- Encryption:
  - Encryption In-Transit
    - SSL/TLS
  - Encryption At Rest
    - Server Side Encryption
      - SSE-S3
      - SSE-KMS
      - SSE-C
  - Client Side Encryption
  - NOTE: Remember that we can use a bucket policy to prevent un-encrypted files from being uploaded by using creating a policy which only allows requests which include the "x-amz-server-side-encryption" parameter in the request header.
- CORS:
  - Cross origin resource sharing
    - Used to enable cross origin access for your AWS resources.
    - ex: S3 hosted webiste accessing js or image files located in another S3 bucket
    - By default resources in one bucket cannot access resources located in another bucket.
    - To allow this we need to configure CORS on the bucket being accessed and enabled access for the origin (bucket) attempting to access.
    - Always use the S3 website URL, bit the regular bucket URL
- CloudFont
  - Edge Location: This is the location where content will be cached. This is separate to an AWS Region/AZ.
  - Origin: This is the origin of all the files that the CDN will distribute. Origins can be an S3 bucket, an EC2 Instance, an Elastic Load Balancer or Route53.
  - Distribution: This is the name given the CDN (distribution domain name), which consists of a collection of Edge Locations.
    - Types of Distribution:
      - Web Distribution : Typically used for websites.
      - RTMP: Used for Media Streaming.
  - NOTE:
    - Edge locations are not just READ only - you can WRITE to them too (i.e. put an object on to them)
    - Objects are cached for the life of the TTL (Time to Live) [Default TTL is 24hrs, Max TTL is 365 days]
    - You can clear cached objects, but you will be charged. ==> Invalidation.
- S3 Performance Optimization:
  - 2 main approaches to performance optimization for S3:
    - GET-Intensive Workloads : Use CloudFront
    - Mixed-Workloads : Avoid sequential key names for your S3 objects. Instead, add a random prefix like a hex hash to the key name to prevent multiple object from being stored on the same partition
