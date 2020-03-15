# EC2:

## Creating EC2 Virtual Machine

- Change your region to N.Virgina(us-east-1)
- Services > Compute > EC2
- Launch Instance
- Choose an Amazon Machine Image (AMI) > Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type [64bit x86]
- Choose Instance Type > General purpose, t2.micro (free tier)
- Configure Instance Details > (default) (NOTE: Network: VPC -> thinks as : Virtual Data center)
- Add Storage > (default)
- Add Tags > Key : name and value : myWebServer
- Configure Security Group > Security Group Name : myWebDMZ
  - Source : Anywhere (of type - SSH)
  - Add New Rule -> Type : HTTP, Source : Anywhere
- Review and Launch
- Select an existing key pair or create a new key pair
  - Create a new key pair > key pair name : myNewKeyPair
  - Download Key Pair
- launch Instance
- View Instance

## Connect to the previously created an Running EC2 VM

-- Connection Method : A Standalone SSH Client

- Putty Key Gen UI is avaliable in Windows, for Linux you need to use command in /bin/bash
- ### Using Putty Key Gen UI in Windows OS
- NOTE : PuttyKeyGen Converts .pem files to .ppk files [bcoz putty only understand ppk file]
- PuttyKeyGen > Load (.pem) file [file you have donwloaded while creating keyPair]
- Save Private Key
- Save .ppk file as : myNewKeyPair.ppk
- Go to Putty
  - IP Address : ec2-user@18.234.38.108 [Syntax : ec2-user@<IPv4_Public_IP>]
  - Connection > SSH > Auth > Browse (.ppk) file which was generated
- ### Using command to enter into EC2 using Ubuntu:
- Go to the file where you have donwloaded myNewKeyOar.pem file (inside downloads)
- \$ chmod 400 myNewKeyPair.pem
- \$ ssh -i "myNewKeyPair.pem" ec2-user@ec2-18-234-38-108.compute-1.amazonaws.com

---

# Play with Amazon EC2 VM Instance

- \$ sudo su
- \$ yum update -y
- \$ yum install httpd -y (Install Apache)
- \$ service httpd start
- \$ chkconfig httpd on
- \$ service httpd status
- \$ cd /var/www/html
- \$ nano index.html
- (Write basic html page) [ctrl+x -> Save][enter]
- Browse : Public Ip Address [http://18.234.38.108/]

---

# EC2 with S3 Role Lab

- Services > IAM > Roles
- Create role > AWS Service > EC2 > Next Permission
- (Select) AmazonS3FullAccess
- Create role (tab) > role name : myS3AdminAccess > Create role
- Service > EC2
- Running Instance > Actions > Instance Settings > Attach/Replace IAM Role
- IAM role : (select) myS3AdminAccess (IAM Role which was created) > Apply
- Enter into AWS CLI using : ssh -i "myNewKeyPair.pem" ec2-user@ec2-18-234-38-108.compute-1.amazonaws.com (where you have mypem)
- (Now lets not use the private key myNewKeyPair.pem role, rather use the above IAM role which was created)
- \$ sudo su
- \$ cd ~/.aws
- \$ ls
- \$ rm credentials
- \$ cd /
- \$ aws s3 ls
- \$ aws s3 ls s3://tsabunkarbucket
- \$ echo "Sabunkar2" > hello2.txt
- \$ aws s3 cp hello2.txt s3://tsabunkarbucket
- \$ aws s3 ls s3://tsabunkarbucket (You can see the file is uploaded in S3 bucket successfully)

- EXAM TIPS :
  - Roles allow you to not use Access Key ID's and Secret Access Keys
  - Roles are preferred from a security perspective
  - Roles are controlled by policies
  - You can change a policy on a role and it will take immediate affect
  - You can attach and detach roles to running EC2 instances without having to stop or terminate these instances.
