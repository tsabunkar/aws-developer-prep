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
