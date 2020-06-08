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
