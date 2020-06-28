# CloudWatch

- What is CloudWatch ?
  - Amazon CloudWatch is a monitoring service to monitor your resources, as well as the applications that you run on AWS
- What can CloudWatch do ?
  - CloudWatch can monitor things like
    - Compute:
      - Autoscaling Groups
      - Elastic Load Balancer
      - Route53 Health Checks
    - Storage & Content Delivery
      - EBS Volumes
      - Storage Gateways
      - CloudFront
    - Databases & Analytics
      - DynamoDB
      - Elasticache Nodes
      - RDS Instances
      - Elastic MapReduce Job Flows
      - Redshft
    - Other
      - SNS Topics
      - SQS Queues
      - Opsworks
      - Cloudwathc logs
      - Estimated Charges on your AWS Bill
- Cloud Watch and EC2
  - Host Level Metrics Consiste of:
    - CPU
    - Network
    - Disk
    - Status Check
  - RAM Utilization is a custom metric! by default EC2 monitoring is 5 minute intervals, unless you enable detailed monitoring which will then make it 1 minute intervals
- How long are CloudWatch Metrics Stored ?
  - You can retrieve data using the GetMetricStaistics API or by using 3rd party tools offered by AWS partners
  - You can store your log data in CloudWatch Logs for as long as you want.
  - Bydefault cloudwatch logs will store your log data ==> indefinitely.
  - You can change the retention for each log group at any time
  - NOTE: You can retrieve data from any termincated EC2 or ELB instance adter its termincation
- Metric Granularity
  - It depends on the AWS service. Many default metrics for many default services are 1 minute, but it can be 3 or 5 minute depending on the service
  - Thus,
    - 1 minute for detailed monitoring
    - 5 minute for standard monitoring
  - NOTE : for custome metric the minimum granularity that you can have is 1 minute
- CloudWatch Alarms
  - You can create an alarm to monitor any Amazon CloudWathc metric in your account
  - This can include EC2 CPU Utilization, Elastic Load Balancer Latency or even the charges on your AWS bill.
  - You can set the appropriate thresholds in which to trigger the alarms and also set what actions should be taken if an alarm state is reached
- CloudWatch can be used on Permise - Not restricted to just AWS resources. Can be on premise too. Just need to download and install the SSM agent and cloudwatch agent

---

# Difference between CloudWatch vs CloudTrail vs Config

- CloudWatch Monitors performance
- CloudTrail monitor API calls in the AWS platform
- AWS Config records the state of your AWS environment and can notify you of changes
