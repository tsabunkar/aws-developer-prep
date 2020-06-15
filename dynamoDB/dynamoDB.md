# What is DynamoDB

- Amazon DynamoDB is a fast and flexible NoSQL db service for all applications that need conistent, single-digit millisecond latency at any scale.
- It is a fully managed db and supports both document and key-value data models.
- Its flexible data model and reliable performance make it a great fit for mobile, web gaming, ad-tech, IoT and many other applications. (No need to definie the schema upfront)
- Stored on SSD storage
- Spread across 3 geographically distinct data centers
- Choice of 2 consistency models:
  - Eventual Consistent Reads (Default)
  - Strongly Consistent Reads
- Eventually Consistent Reads:
  - Consistency across all copies of data is usally reached with a second.
  - Repeating a read after a short time should return the update data (Best Read Performance)
- Strongly Consistent Reads:
  - A strongly consistent read returns a result that reflect all writes that recieved a sucessful response prior to the read.

## DynamoDB

- Tables
- Items (Think a row of data in a table)
- Attributes (think of a column of data in a table)
- Supports key-values and document data structures
- Key = The name of the data, Value = the data itself
- Documents can be written in JSON, HTML or XML

## DynamoDB- Primary Keys

- DynamoDB stores and retrieves data based on Primary Key
- 2 types of Primary Key:
  - Partition Key :
    - Unique attribute (ex- userID)
    - Value of the partition key is input to an internal hash function which determines the partition or physical location on which the data is stored.
    - If you are using the partition key as your primary key, then no two items can have the same parition key
  - Composite Key
    - combination of Partition Key + Sort Key
    - ex : Same user posting multiple times to a forum
      - Primary key would a composite key consisting of:
        - Partition Key - User ID
        - Sort Key - Timestamp of the post
      - 2 items may have the same Partition key, but they must have different Sort Key.
      - All items with the same partition key are stored together, then sorted accordingly to the sort key value.
      - Allows you to store multiple items with the same Partition Key.

## DynamoDB Access Control

- Authentication and Access Control is managed using AWS IAM.
- You can create an IAM user within your AWS account which has specific permissions to access and create DynamoDB tables.
- You can create an IAM role which enables you to obtain temporary access keys which can be used to access DynamoDB.
- You can also use a special 'IAM Condition' to restrict user access to only their own records.
  - example:
    - Imagine a mobile gaming application with millions of users.
    - Users need to access the high scores for each game they are playing.
    - Access must be restricted to ensure they cannot view anyone else's data. thus we can use 'IAM Condition'.
    - This can be done by adding a CONDITION to an IAM Policy to allow access only to items where the Partition Key Value matches their User ID.
    - [./assets/IAM-Confitions.png]

---

# Examp Tips of DynamoDB

- Amazon DynamoDB is low latency NoSQL database
- Consists of Tables items and Attributes
- Supports both document and key-value data models
- Supported document formats are JSON, HTML, XML
- 2 Types of Primary Key- Partition Key and Composite Key (Partition Key + Sort Key)
- 2 consistency models : Strongly Consistent / Eventually Consistent
- Access is controlled using IAM Policies
- Fine grained access control using IAM Condition Parameter : dynamodb:LeadingKeys to allow users to access only the items where the partition key value matched their user ID

---

# What is Index ?

- In SQL database, an index is a data structure which allows to you perform fast queries on sepcific columns in a table. You select the columns that you want included in the index and run your searches on the index- rather than on the entire dataset.
- In DynamoDB, 2 Types of Index are supported to help speed-up your dynamoDB queries:
  - Local Secondary Index
  - Global Secondary Index
- Local Secondary Index
  - Can only be created when you are creating your table.
  - You cannot add, remove or modify it later.
  - It has the same Partition Key as your original table
  - But a different Sort Key
  - Gives you a different view of your data, organised according to an alternative Sort Key.
  - Any queries based on this Sort Key are much faster using the index that the main table.
  - Ex: Partition Key : UserID, Sort Key : Account creation date
- Gloabl Secondary Index
  - You can create when you create your table, or add it later
  - Different Partition Key as well as a Different Sort Key
  - So gives a completely different view of the data
  - Speeds up any queries relating to this alternative Partition and Sort Key
  - ex: Partition Key: email address, Sort Key :last log-in date

---

# Examp Tip for DynamoDB Indexes

- Indexes enable fast queries on specific data columns.
- Give you a different view of your data, based on alternative Partition/Sort Keys
- Important to undestand the differences.
- Local Secondary Index
  - Must be create when you create your table
  - Same Partition key as your table
  - Different Sort Key
- Global Secondary Index
  - Can create any time
  - Different Partition Key
  - Different Sort Key

---

# Scan v/s Query API

- What is query

  - A Query operation finds items in a table based on the Primary Key attribute and a distinct value to search for
  - ex: select an item where the UserID is equal to 212, will select all the attributes for that item, ex first name, surname or email etc
  - Use an optional Sort Key name and value to refine the results.
  - ex: if your Sort Key is a timestamp, you can refine the query to only select items with a timestamp of the last 7 days.
  - By default, a query returns all the attributes for the items but you can use the ProjecionExpression parameter if you want the query to only return the specific attributes you want.
  - ex: if you only want to see the email address rather than all the attributes
  - Results are always sorted by the Sort Key
  - Numeric order - by default in ascending order (1,2,3,4)
  - ASCII character code values
  - You can reverse the order by setting the 'ScanIndexForwardparameter' to false
  - By defualt, Queries are Eventually Consistent
  - You need to explicitly set the query to be strongly consistent

- What is Scan

  - A scan operation examines every item in the table
  - Bydefault return all data attributes
  - Use the 'ProjectionExpression' Parameter to refine the scan to only return the attributes you want.

- What to use Query or Scan ?

  - Query is more efficient than a scan
  - Scan dumps the entire table, then filters out the values to provide the desired result result - removing the unwanted data
  - This adds an extra step of removing the data you don't want
  - As the table grows, the scan operation takes longer
  - Scan operation on a large table can use up the provisioned throughput for a large table in just a single operation

- How to improve performance
  - You can reduce the impact of a query or scan by setting a smaller page size which uses fewer read operations
  - ex- set the page size to return 40 items
  - Large number of smaller operations will allow other requests to succeed without throttling the db
  - Aviod using scan operations if you can: design tables in a way that you can use the Query, Get or BatchGetItem APIs
  - Parallel Scans
    - By default, a scan operation processes data sequentially in returning 1MB increments before moving on to retrieve the next 1MB of data. It can only scan one partition at a time
    - You can configure DynamoDB to use Paralled scans instead by logically dividing a table or index into segments and scanning each segment in parallel.
    - Best to avoid paralled scans if your table or index is already incurring heavy read/wite activity from other applications

---

# Scan vs Query Exam Tips

- A query operations finds items in a table using the PK attribute
- You provide PK name and a distinct value to search for
- A scan operation examines every item in the table
- By default returns all data attributes
- Use the ProjectionExpression parameter to refine the results
- Query results are always sorted by the Sort Key is there is one
- Sorted in ascending order
- Set ScanIndexForward parameter to false to reverse the order - queries only
- Query operation is generally more efficient than a scan
- Reduce the impact of a query or scan by setting a smaller page size which uses fewer read operations.
- Isolate scan operations to sepecific tables and segregate them from your mission-critical traffic
- Try Paralled scans, rather than the default sequential scan
- Avoid using scan operations if you can: design tables in a way that you can use the Query, Get or BatchGetItem APIs

---

# DynamoDB Read and Write Capacity Units

- DyanmoDB Provisioned Throughput is meashred in Capacity units.
- When you create your table, you specify your requirements in terms of Read Capacity Units and Write Capacity Units.
- 1 x Write Capacity Unit = 1 x 1KB Write per second
- 1 x Read Capacity Unit = 1 x Storngly Consitent Read of 4KB per second (or)
  2 x Eventaully Consistent Reads of 4 KB per second (Default)
- DynamoDB Example Configuration
  - Table with 5 x Read Capacity Units and 5 x Write Capacity Units
  - This configuration will be able to perform:
    - 5 x 4KB Strongly Consistent reads = 20KB per second
    - Twice as many Eventaully Consistent = 40KN
    - 5 x 1KB Writes = 5KB per second
  - If your application reads or writes larger items it will consume more capacity units and will cost you more as well
- Strongly Consistent Read Calculation Problem
  - Your application needs to read 80 items (table rows) per second.
  - Each item 3KB in size
  - You need Strongly Consistent Reads
  - Solution :
    - First, calculate how many Read Capacity Units needed for each read: Size of each item / 4KB (3KB / 4KB = 0.75)
    - Rounded-up to the nearest whole number, each read will need 1 x Read Capacity Unit per read operation
    - Multiplied by the number of reads per second = 80 Read Capacity Units required
- Eventually Consistent Read Calculation Problem
  - What if you Eventually Consistent Read ?
  - You do the same calculation. However as this is for Eventually Consistent reads and you 2 x 4KB reads per second- or _double_ the throughtput of Strongly Consistent reads.
  - Size of each item / 4KB
    - 3KB / 4KB = 0.75 Round-up to the nearest whole number = 1
    - Multiply by the number of reads per second = 80
  - Divide 80 by 2, so you only need 40 Read Capacity Units for Eventually Consistent reads
- Write Capacity Units Calculation
  - You want to write 100 items per second
  - Each item 512 bytes in size
  - Solution :
    - First, calculation how many Capacity Units for each write: Size of each item / 1KB (for Write Capacity Units) [512 bytes / 1KB = 0.5]
    - Rounded-up to the nearest whole number, each write will need 1 x Write Capacity Unit per write operation
    - Multiplies by the number of write per second = 100 write Capacity Units required
- Exam Tips:
  - Provisioned Throughput is measured in Capacity Units
  - 1 x Write Capacity Unit = 1 x 1KB Write per second
  - 1 x Read Capacity Unit = 1 x 4KB Strongly Consistent Read (or) 2 x 4KB Eventually Consistent Reads per second

---

# DynamoDB On-Demand Capacity Options

- Charges apply for Reading, Writing and Storing data om 2018
- With On-Demand, you don't need to specify your requirements
- DynamoDB instantly scales up and down based on the activity of your application
- Great for unpredictable workloads
- You want to pay for only what you use (pay per request), Great for Serverless stack

- Which Pricing Model Should I Use
  - On-Demand Capacity:
    - Unknown Workloads
    - Unpredictable application traffic
    - You want a Pay-per-use model
    - Spiky, short lived peaks
  - Provisioned Capacity:
    - You can forecast read and write capacity requirements
    - Predictable application traffic
    - Application traffic is consistent or increases gradually

---

# DynamoDB Accellorator (DAX)

- What is DAX:
  - DynamoDB Accellorator is a fully managed, clustered in-memory cache for DynamoDB
  - Delivers up to 10x read performance improvement (only for Read performance)
  - Microsecond performance for millions of requests per second
  - Ideal for Read-Heavy and bursty workloads
  - ex: Autcion applications, gaming and retail sites during black Friday/Christmas promotions
- How does it work ?
  - DAX is write-through caching service- this means data is written to the cache as well as the back end store at the same time
  - Allows you point you DynamoDB API calls at the DAX cluster
  - If the item you are querying is in the cache (cache hit), DAX returns the result to the application.
  - If the item is not avaliable (cache miss) then DAX performs an Eventually Consistent GetItem operation against DynamoDB tables.
  - Retrieval of data from DAX reduces the read load on DynamoDB tables
  - May be able to reduce Provisioned Read Capacity
- WHat is NOT Suitable for DAX ?
  - Caters for Eventually Consistent reads only- so not suitable for applications that require Strongly Consistent reads
  - Not Suitable for:
    - Write intensive applications
    - Applications that do not perform many reads operations
    - Applications that do not require microsecond response times
- DAX Exam Tips:
  - Provided in-memory caching for DynamoDB tables
  - Improves response times for Eventaully Consistent reads only
  - You point your API calls the DAX cluster, instead of your table
  - If the item you are querying is on the cache, DAX will return it; otherwise it will perform an Eventually Consistent GetItem operation to your DynamoDB table
  - Not suitable for write-intensive applications or applications that require Strongly Consistent reads

---

# Elasticache

- Elasticache is in memory cache in the cloud
- Improves performance of web applications, allowing you to retrieve information from fast in-memory caches rather than slower disk based databases
- Sits between your application and the database:
  - ex: An application frequently requesting specific product information for your best selling products
- Take the load off your db
- Good if your db is particularly read-heavy and the data is not changing frequently
- Improves performance for read-heavy workloads
  - ex: Social Networking, gaming media sharing, Q&A portals
- Requently-accessed data is stored in memory for low-latency access, improving the overall performance of your application
- Also good for compute heavy workloads
  - ex: recommendation engines
- Can be used to store results of I/O intensive db queries or output of compute-intensive calculation
- 2 Types of Elasticache
  - Memcached
    - widely adopted memory object caching system
    - Multi-threaded
    - No Multi-AZ capability in AWS
  - Redis
    - Open-source in-memory key-value store
    - Supports more complex data strucutres: sorted sets and lists
    - Supports Master / Slave replication and Mult-AZ for cross AZ redundancy
- Caching Stragies
  - 2 Stragies avaliable: Lazy Loading and Write-Through
  - Lazy Loading
    - Loads the data into the cache only when necessary
    - If requested data is in the cache, Elasticache returns the data to the application
    - If the data is not in the cache or has expired, Elasticache returns a null
    - Your application then fetches the data from the db and write the data recieved into the cache so that it is avaliable next time.
    - Advantages:
      - Only requested data cached: Avoids filling up cache with useless data
      - Node failures are not fatal a new empty node will just have a lot of cache misses initially
    - Disadvantages:
      - Cache miss penalty: Initial request Query to db writing of data to the cache
      - Stale data - if data is only updated when there is a cache miss, it can become stale. Doesn't automatically update if the data in the db changes
    - To remove Stale data:
      - TTL (Time to Live):
        - Specifies the number of seconds until the key (data) expires to avoid keeping stale data in the cache
        - Lazy loading treats an expired key as cache miss and causes the application to retireve the data from the db and subsequently write the data into the cache with a new TTL
        - Does not eliminate stale data - but helps to avoid it
  - Write-through:
    - Adds or updates data to the cache whenever data is written to the db
    - Advantages:
      - Data in the cache never stale
      - Users are generally more tolerant of additional latency when updating data than when retrieving it.
    - Disadvantages:
      - Write pentaly: Every write involves a write to the cache as well as a write to the db
      - If a node fails and a new one is spun up, data is missing untill added or updated in the db (mitigate by implementing lazy loading in conjunction with write-through)
      - Wasted resources if most of the data is never read (Main disadvantages)
- Difference b/w DAX and Elasticache: DAX was specifically developed for in-memory DynamoDB, only supports write through caching stragey (no lazy-laoding). Elasticache is generally used for in-memory for RDS
- Exam Tips:
  - In-memory cache sits b/w your application and db
  - 2 different caching strategies: Lazy loading and Write Through
  - Lazy loading
    - only caches the data when it is requested
    - Elasticache Node failures not fatal, just lots of cache misses
    - Cache miss pentaly: Initial request, Query db, writing to cache
    - Avoid stale data by implementing a TTL
  - Write through
    - strategy writes data into the cache whenever there is a change to the db
    - Data is never stale
    - Write penalty: Each writes invovles a write to the cache
    - Elasticache node failure means that data is missing untill added or updated in the db
    - Wasted resources if most of the data is never used

---

# DynamoDB Transactions

- ACID Transaction (Atomic, Consistent, Isolated, Durable) [these are the ideal properites for db transaction]
- Read or write multiple items across multiple tables as an all or nothing operation
- Check for a pre-requisite condition before writing to a table
- kind of all or nothing transaction

---

# DynamoDB TTL

- Time to live attribute define an expiry time for your data
- Expired items marked for deletion
- Great for removing irrelevant or old data:
  - Session data
  - Event logs
  - Temporary data
- Reduces cost by automatically removing data which is no longer relevant
- TTL is expressed as epoch time (Unix time)
- Expiration is set for 2 hours after the session began
- When the current time is greater than the TTL, the item will be expired and marked for deletion
- You can filter out expired items from your queries and scans
- To converte epoch time stamp - https://www.epochconverter.com/

---

# DynamoDB Streams

- Time-ordered sequence of item level modifications (insert, update, delete)
- Logs are encrypted at rest and stored for 24 hours
- Accesses using a dedicated endpoint
- Bydefault the PK is recorded
- Before and After images can be captured
- [./assets/dynamodb-streams.png]
- Processing DynamoDB Streams
  - Events are recorded in near real-time
  - Applications can take actions based on contnets
  - Event source for lambda
  - Lambda polls the DynamoDB stream
  - Executes Lambda code based on a DynamoDB Streams event
  - [assets/dynamoDB-streams-trigger.png]
- Exam Tips:
  - Time-ordered sequence of item level modifications in your DynamoDB tables
  - Data is stored for 24 hours only
  - Can be used as an event source for lambda so you can create applications which take actions based on events in your DynamoDB table

---
