# SQS

- SQS is a distributed message queueing system
- SQS allows you to decouple the components of an application so that they are independent
- Pull-based not push-based
- 2 types of Queues
  - Standard Queues(default): best effort ordering, message delivered at least once
  - FIFO queues (first IN first OUT): ordering strictly preserved, message delievered once, no duplicates (ex- good for banking transactions which need to happen in strict order)
- Visibility Timeout
  - Default 20 seconds - increase if your task takes > 30 seconds to complete
  - Max 12 hours
- 2 types of polling:
  - Short Polling - returned immediately even if no messages are in the queue
  - Long polling - polls the queue periodically and only returns a response when a message is in the queue or go the timeout is reached

# SNS

- SNS is a scalable and highly avaliable notification service which allows you to send push notifications from the cloud
- A variety of message formats are supported: SMS text message, email, Amazon Simple Queue Service (SQS) queues, any HTTP endpoint
- Pub-Sub model whereby users subscribe to topics
- It is a push mechanism rather than a pull mechanism
- Example architecture: a company wanting to send notifications to multiple customers could use SNS to fan out multiple messages in SQS format using a dedicated SQS queue per customer

# SNS v/s SES

- Remember that SES is for email only
- It can be used for incoming and outgoing mail
- It is not subscription based- you only need to know the email addr

- SNS caters for various formats (SMS, SQS, HTTP, email)
- Push notifications only
- Pub/sub model- consumers must subscribe to a topic
- You can fan out messages to large number of recipients, (ex- multiple clients each with their own SQS queue)

# Kinesis

- Kinesis Streams
  - Video Streams- securely stream video from connected fevices to AWS for analytics and machine learning
  - Data Streams- Build custom applications process data in real-time
- Kinesis Firehose- capture, transform, load data streams into AWS data stores for near real-time analytics with BI tools
- You can configure Lambda to subscribe to a Kinesis Stream and execute a function on your behalf when a new record is detected, before sending the processed data on to its final destination

# Elastic Beanstalk

- Deploys and scales your web applications including the web application server platform where required
- Support wide programming languages
- As well as application server platform - tomcat, passenger, puma, IIS
- Provisions the underlying resources for you
- Can fully manage the EC2 instances for you or you can take full administrative control
- Updates, Monitoring, metrics and health checks all included

# Updating Elastic Beanstalk

- 4 deployment approaches
  - All at once
    - Service interruption while you update the entire environment at once
    - To roll back, perform a future all at All at Once upgrade
  - Rolling
    - Reduced capacity during deployment
    - To roll back, perform a future rolling update
  - Rolling with Additional Batch
    - Maintains full capacity
    - To roll back, perform a future rolling update
  - Immutable
    - Perferred option for mission cirtical production systems
    - Maintains full capacity
    - To roll back, just delete the new instances and autoscaling group

# Advanced Elastic Beanstalk

- You can customize your Elastic Beanstalk environment by adding configuration files
- The files are written in YAML or JSON
- Files have .config extension
- The .config files are saved to .ebextensions folder
- you.ebextensions folder must be located in the top level directory of your application source code bundle

# RDS & Elastic Beanstalk

- Two different options for launching your RDS instance
  - Launch within Elastic Beanstalk
    - When you terminate the EBS environment, the db will also be terminated
    - Quick and easy to add your db and get started
    - Suitable for Dev and Test environments only
  - Launch otuside Elastic Beanstalk
    - Additionnal configuration steps required - Security Group and Connection information
    - Suitable for Production environments, more flexibility
    - Allows connection from multiple environments, you can tear down the application stack without impacting the db
