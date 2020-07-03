# AWS CLI Paginiation

- You can control the number of items included in the output when you run a CLI command
- By default, the AWS CLI uses a page size of 1000 (page-size=1000)
- i.e- if you run aws S3api list-objects my_bucket- on a bucket which contains 2500 objects, the CLI actually makes 3 API calls to S3. but displays the entire output in one go.
- Errors
  - If you see errors when running list commands on a large number of resources, the default page size of 1000 might be too high
  - You most likely to see a "timed out error", because the API call has exceeded the maximum allowed time to fetch the required results.
- Fixing Errors:
  - Use the --page-size option to have the CLI request a smaller number of items from each API Call
  - The CLI still retireves the full list, but performs a large number of API calls in the background and retrieves a smaller number of items with each call
  - exampe:
    - \$ aws s3api list-objects --bucket my-bucket --page-size 100
    - use the --max-items option to return fewer items in the CLI output
    - \$ aws s3api list-objects --bucket my-bucket --max-items 100

---

# Testing IAM Policy Simulator

- IAM Policy Simulator
  - This tool- test the effects of IAM policies before committing them to production
  - Validate that the policy works as expected
  - Test policies already attached to exisiting users - great for troubleshooting an issue which you suspect is IAM related
  - https://policysim.aws.amazon.com
  - It can help to simulate Users, Groups, Roles

# LAB

    - https://policysim.aws.amazon.com
    - (select) devUser1
    - (show the policies applied to this user)
    - select service > (select) Amazon Athena
    - Select All
    - Run Simulation
    - (In permission column - check its permission is denied or allowed)
    - allowed   1 matching statements. (click)
    - Show statement in AdministratorAccess (IAM Policy) (Click)
    - (you can see  AWS Managed Policy in JSON Format in left panel)

---

# Kinesis Shards v/s Consumers

- [.assets/kinesis.png]
- A Kinesis data stream is a set of shards
- A shard is a sequence of data records in a stream, each data record has a unique sequence number
- The data capacity of your stream is the sum total capcity of its shards
- Per shard:
  - 5 read transactions per second, up to a maximum of 2MB per second
  - 1000 write records per second, up to max of 1MB per second
- As your data rate increases, you increase the number of shards (resharding)
- Consumers (EC2 instances which are consuming)
  - Kinesis Client Library runs on the consumer instances
  - Tracks the number of shards in your stream
  - Discovers new shards when you reshard
- Kinesis Client Library
  - The KCL ensures that for every shard there is a record processor
  - Manages the number of record perocessors relative to the number of shards & consumers
  - If you have only one consumer, the KCL will create all the record procesors on a single consumer
  - If you have two consumers it will load balance and create half the processors on on instance and half on another
  - [.assets/consumers.png, consumers-2.png]
- What about scaling out the consumers?
  - With KCL, generally you should ensure that the number of instances does not exceed the number of shards (except for failure or standby purposes)
  - You never need multiple instances to handle the processing load of one shard
  - However, one worker can process multiple shards
  - Its fine if the number of shard exceeds the number of instances
  - Don't think that just bcoz you reshard, that you need to add more instances
  - Instead, CPU utilisation is what should drive the qualitiy of consumer instances you have, NOT the number of shards in your kinesis stream
  - Use an Auto Scaling group, and base scaling decisions on CPU load on your consumers
- EXAMP Tips:
  - The kinesis client Library running on your consumers creates a record processor for each shard that is being consumed by your instance
  - If you increase the number of shards, the KCL will add more record processors on your consumers
  - CPU utilisation is what should drive the quantity of consumer instances you have, NOT the number of shards in your Kinesis stream
  - Use an Auto Scaling group, and base scaling decisions on CPU load on your consumers
