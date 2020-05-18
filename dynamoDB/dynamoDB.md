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
