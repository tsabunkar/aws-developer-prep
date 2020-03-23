# RDS Lab (Creating RDS MYSQL Instance and trying to connect form EC2 Instance using PHP)

- Services > Database > RDS > Create database
- Select MySQL > Free tier
- databse instance identifier: mysqldbs, Master username : mysqldbs
- VPC security group ( Create new, New VPC security group name : RDS )
- Additional Configuration > Initial database name : mysqldbs

- (Till the db is created goto)

- Services > EC2 > Launch Instance
- Amazon Linux 2 AMI
- Configuration Instnace Details > Advanced Details > (write your bootstrap scripts) [Copy+paste the content of rdsbash.sh inside -> User data]

  <!-- - (but before, need to host connect.php file in ur S3 storage and link the url in rdsbash.sh file)
    [

    S3 > Create bucket > bucket Name : connect-rds-mysql-ec2-php, Disable block all public access > Upload > add connect.php file > Click on the object/file > Object URL (Copy)
    {NOTICE: Make sure your bucket policy is public by adding script in s3/s3-bucket-policy-public}

    ] -->

- Next, Configure Security Group > (select) Select an existing security group >
  myWebDMZ
- Review and Launch
- Select exisitng key pair : myNewKeyPair > launch
- Onces your instance is running
- Terminal > (place where you have donwloaded your .pem file) [navigate to ~/tejas/other-apps/amazon-aws] > $ chmod 400 myNewKeyPair.pem > \$ ssh -i "myNewKeyPair.pem" ec2-user@ec2-3-84-142-97.compute-1.amazonaws.com (This command you can find from Connect > Connect to your instances)
- sudo su
- cd /var/www/html
- ls
- nano connect.php
- (Change username, password, hostname and dbname -> \$hostname = RDS endpoint)
- cat connect.php
- EC2 Instance > Stop > Start (again)
- Browse EC2 IPv4 : http://3.81.110.142/
- visit : http://3.81.110.142/connect.php [It will give error: Unable to connect to MySQL]
- RDS end-point : mysqldbs.cenumda0weo3.us-east-1.rds.amazonaws.com

- Goto Security Group
- RDS > Security Group Rules > (Select) Inbound > Inbound Rules > Edit Inbound rules
- Add Rule > Type : MySQL/Aurora, Source : myWebDMZ > Save Rule
