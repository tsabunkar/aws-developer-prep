sudo yum update
sudo yum install ruby
sudo yum install wget
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
ll
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent status (o/p-> The AWS CodeDeploy agent is running as PID 12552)

----
Syntax: wget https://aws-codedeploy-<region>.s3.amazonaws.com/latest/install 
----

------------

