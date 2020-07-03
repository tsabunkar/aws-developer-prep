# Monitoring EC2 with Custom Metrics

- Services > IAM
- Roles (tab)
- Create role
- Choose a use case: EC2 > Next
- Attach permissions policies: CloudWatchFullAccess
- Role name: cloudwatch-ec2
- Service > EC2
- Launch Instance
- Configure Instance Details
  - IAM role : cloudwatch-ec2
  - User data: (Copy + paste content of cloudwatch.sh)
- Add Tags
  - Key: name, Value: EC2CloudWatch
- Configure Security Group
  - Select an existing security group: myWebDMZ
- Launch Instance
- (Local Terminal - Connect SSH)
  - \$ cd /home/tejas/tejas/other-apps/amazon-aws/689b24d56e26
  - \$ ssh -i "myNewKeyPair.pem" ec2-user@ec2-3-94-247-69.compute-1.amazonaws.com
  - \$ ls (aws-scripts-mon)
  - \$ cd aws-scripts-mon
  - \$ ls
  - \$ /home/ec2-user/aws-scripts-mon/mon-put-instance-data.pl --mem-util --verify --verbose
  - \$ /home/ec2-user/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail
  - \$ cd /etc
  - \$ nano crontab (Creating cron-job)
  - \$ astrix/1 astrix astrix astrix astrix root /home/ec2-user/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail (Check this command in [./cloudwatch.sh])
- Services > Management & Governance > CloudWatch
- Metrics (tab)
- EC2 > Per-Instance Metrics
- Linux System > InstanceId