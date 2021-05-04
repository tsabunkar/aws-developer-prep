# AWS Certified Developer :

- 130 Minutes
- 65 Questions
- Results are immediate
- Pass marks is 720 out of 1000
- 11k Rupees
- MCQ Type questions
- Valid for 2 years
- Scenario based questions

---

# To Host static website in AWS S3 bucket

Link :
https://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html#root-domain-walkthrough-create-buckets

---

# AWS CLI Configuration

- Install aws cli locally in ur linux :
  - \$ cd ~/tejas/other-apps/aws
  - \$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  - \$ unzip awscliv2.zip (Type: A)
  - \$ cd aws
  - \$ sudo ./install
  - \$ aws --version
  - \$ which aws
- To check for aws latest update and update
  - \$ cd ~/tejas/other-apps/aws
  - \$ sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update (Update aws cli versio)
- To configure for aws for specific user/developer
  - Services > Security, Identity, & Compliance > IAM
  - Users
  - Tejas-Dev (Who current have admin access)
  - Security Credentials
  - Access Key (tab), If you have not downloaded Secrete access key in your local delete previous entry and create new accessKeys.csv file store in your local.
  - \$ aws configure
    - (enter your access key ID and Secret access key)
    - Default region name: us-east-1 [US East (N. Virginia)]
    - Default output format: json
  - \$ aws s3 ls

REF:

- https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
- https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

---

# AWS Resources

- Official AWS FAQs
- Whitepapers
- re:Invent Videos

- FAQ Topic to focus on :- Serverless, Dev Tools, Security, Automation & Monitoring, Containers, Message & Steaming
- https://aws.amazon.com/faqs/

- Whitepapaers
  - https://aws.amazon.com/whitepapers/?whitepapers-main.sort-by=item.additionalFields.sortDate&whitepapers-main.sort-order=desc
  - https://d1.awsstatic.com/whitepapers/DevOps/practicing-continuous-integration-continuous-delivery-on-AWS.pdf -https://d1.awsstatic.com/whitepapers/AWS_DevOps.pdf
  - https://d1.awsstatic.com/whitepapers/AWS_Blue_Green_Deployments.pdf
  - https://d1.awsstatic.com/whitepapers/serverless-architectures-with-aws-lambda.pdf
  - https://d1.awsstatic.com/whitepapers/docker-on-aws.pdf
  - https://d1.awsstatic.com/whitepapers/DevOps/running-containerized-microservices-on-aws.pdf
  - https://d1.awsstatic.com/whitepapers/optimizing-enterprise-economics-serverless-architectures.pdf
  - https://d1.awsstatic.com/whitepapers/Security/AWS_Security_Best_Practices.pdf

---

# Adding a billing Alarm to recieve email notifications when thershould is reached (CloudWatch)

- Goto Billing & cost Management Dashboard: https://console.aws.amazon.com/billing/home?#/
- Preferences > Billing preferences
- Receive Billing Alerts (select this checkbox)
- Save preferences
- (Create a billing Alaram)
  - Goto Cloudwatch : https://console.aws.amazon.com/cloudwatch
  - Click Alarms
  - Create Alarm
  - Graph > (click) Select Metric
  - Metrics (search for)- Billing > By Service
  - Select: AmazonRDS USD EstimatedCharges
  - select metric
  - Conditions :
    - Threshold type : Static
    - Whenever EstimatedCharges is.. : Greater
    - than.. : 13 USD (1000 rupees)
    - Next
  - Alarm State Trigger:
    - (If no previously topic created for email notification) then
      - Select an SNS topic: Create new topic
      - Send a notification to : AWS-BILLING-MORE-THAN-1k
      - email: tsabunkar@gmail.com
      - Next
  - Alarm Name and description
    - Alarm name: RDSInstanceBillAlert
    - Alarm Description: RDS Instance Billing had exceed more than 1K rupees or 13 USD
    - Next
  - Create Alaram
  - Goto Gmail - You will recieve a mail from AWS for confirmation on Amazon SNS notification service (confirm it)
