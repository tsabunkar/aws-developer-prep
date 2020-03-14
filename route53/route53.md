# Route53

- Rout53 is amazon's DNS Service
- Allows you to map your domain names to
  - EC2 Instances
  - Load Balanacer
  - S3 bucket

---

# Lab

## Create Route53 domain name

- Services > Networking & Content Delivery > Route53
- Domain registration > Register Domain (If you want to by new domain name : tsabunkar.com)

## If you already have domain name

- Services > Networking & Content Delivery > Route53
- DNS Managment > Create Hosted Zone
- Domain Name : tsabunkar.in > Create
- Create Record Set > (but before, you should have load balancer created/avaliable, Follow below section first then come back here)
  - Name : (empty).tsabunkar.in [Since we dont wont www]
  - Type : A- IPv4 Address
  - Alias : Yes
  - Alias Target : (Select) ELB Application Load Balancer [dualstack.myAppLoadBalancer-1157413760.us-east-1.elb.amazonaws.com ] (Application Load Balancer which was created)
  - Create

---

# Create Load Balancer

- Services > EC2
- (SideNavbar) LOAD BALANCING > Load balancers > Create Load Balancer
- Select load balancer type > Application Load Balancer (create)
- Configure Load Balancer >
  - Name : myAppLoadBalancer
  - VPC : select any two
- Configure Security Groups > (Select) myWebDMZ
- Configure Routing > (Routing the request to different target web-servers)
  - Target Group > Name : myWebServersGroup
  - Health checks > Path : /index.html
- Register Targets
  - (Select the EC2 Instances which is running) > Next
- Create
- Load Balancers (Dashboard) > State : provisioning
- State should be -> active

---

# Pointing godaddy domain name to EC2 instance via Application Load Balancer

## I have domain name buyed from GoDaddy : tsabunkar.in and My EC2 Instance is running my webapp in 18.234.38.108 Ipv4 Addres (Now to inter-link this) -

- Go to GoDaddy > DNS [https://dcc.godaddy.com/manage/TSABUNKAR.IN/dns]
- Records : Add new record
  - Type : A, Name : www, value : 18.234.38.108
- now visit : http://www.tsabunkar.in/

- SOURCE : https://serverfault.com/questions/560552/how-to-forward-godaddy-domain-to-ec2-load-balancer/560557?newreg=dc6129e6aeb041bfb59dcb93b2d075f3

---

# To Create a file and store inside S3 bucket using AWS CLI

- To list everything in aws buckets : \$ aws s3 ls
  - error : Unable to locate credentials. You can configure credentials by running "aws configure".
  - \$ aws configure
  - To solve aws console : services > Security, Identity, & Compliance > IAM
  - Users > Add User
  - User name : Tejas-Dev, Access Type : Programmatic access
  - Create Group > Group name : Dev-Group, Policy-type : AdministratorAccess
  - Create user
  - Download the Access KeyID and Scret Access Key
  - Enter this acess KeyID and Scret Access Key, in CLI -> aws confifure
- \$ aws s3 ls
- \$ aws s3 mb s3://tsabunkarbucket (make-bucket)
- \$ echo "hello S3 bucket from tejas" > hello.txt
- \$ ls -l
- \$ aws s3 cp hello.txt s3://tsabunkarbucket
- \$ aws s3 ls s3://tsabunkarbucket

- To see in AWS webiste : Services > Storage > S3
- Link for AWS CLI : https://docs.aws.amazon.com/cli/latest/index.html

## Exam Tips :

- Least Privilege - Always give your users the minimum amount of access required.
- Create Groups - Assign your users to groups. Your users will automatically inherit the permissions of the group. The groups permissions are assigned using policy documents.
- Secret Access Key- You will see this only once. If you do not save it, you can delete the key Pair (Access key ID and Secret Access Key) and regenerate it. You will need to run aws configure again.
- Do not use just one access key - Do not create just one access key and share that will all your developers. If someone leaves the company on bad terms, then you will need to delete the key and create a new one and every developer would then need to update their keys. instead create one key pair per developer.
- You can use CLI on your PC- You can install the CLI on you MAC, Linux or Windows. I personally use S3 to store all my files up in the cloud

---
