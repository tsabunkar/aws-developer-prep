# Elastic-Beanstalk

- Elastic Beanstalk is a service for deploying and scaling web applications developed in many popular languages - java, .net, php, nodejs, python, ruby, go and docker onto widely used application server platform like- Apache Tomcat, nginx, Passenger and IIS
- Developers can focus on writing code and don't need to worry about any of the underlying infrastructure needed to run the application
- Write code and zip all your modules and throw in beanstalk it will set-up all the required environment for you (webserver, rds, etc)
- You upload the code and Elastic Beanstalk will hanle deployment, capacity provisioning, load balancing, auto-scaling and application health.
- You retain full control of the underlying AWS resources powering your application and you pay only for the AWS resources required to store and run your applications (ex- EC2 instances and S3 buckets)
- What is Elastic Beanstalk ?
  - Fatest and simplest way to deploy your application in AWS
  - Automatically scales your application up and down
  - You can select the EC2 instance type that is optimal for your application
  - You can retain full administrative control over the resources powering your application, or have Elastic Beanstalk do it for you
  - Managed platform updates feature automatically applies updates your OS, Java, php, Nodejs, etc
  - Monitor and manage application health via a dashboard
  - Integrated with CloudWatch and X-Ray for performance data and metrics
- Exam Tips:
  - Deploys and scales your web applications including the web application server platform where required
  - Supports wide used programming languages
  - Applications server platform - tomact, passenger, nginx, iis
  - provisions the underlying resources for you
  - Can fully manage the EC2 instances for you or you can take full administrative control
  - updates, monitoring, metrics and health checks all included

---

# EBS Deployment policies

- Elastic Beanstalk supports several options for processing deployments:

  - All at once
  - Rolling
  - Rolling with additional batch
  - Immutable

- All at once Deployment Updates:

  - Deploys the new version to all instances simultaneously
  - All of your instances are out of service while the deployment takes place
  - You will experience an outage while the deployment is taking place- not ideal for mission-critical production systems
  - If the update fails, you need to roll back the changes by re-deploying the original version to all your instances

- Rolling Deployment Policy:

  - Deploys the new version in batches
  - Each batch of instances is taken out of service while the deployment takes out of service while the deployment takes place
  - Your environment capacity will be reduced by the number of instances in a batch while the deployment takes place
  - Not ideal for performance sensitive systems
  - If the update fails, you need to perform an additional rolling update to roll back the changes

- Rolling with additional batch Policy:

  - Launches an additional batch of instances
  - Deploys the new version in batches
  - Maintains full capcity during the deployment process
  - If the udpate fails, you need to perform an addtional rolling update to rollback the changes

- Immutable Policy:

  - Deploys the new version to a fresh group of instances in their own new autoscaling group
  - When the new instances pass their health checks, they are moved to your exisiting auto scaling group; and finally the old instances are terminated
  - Maintains full capacity during the deployment process
  - The impact of a failed update is far less, and the rollback process requires only terminating the new auto scaling group
  - Preffered option for mission critical production systems

---

# Configuring Elastic Beanstalk

- You can custmoize your elastic beanstalk environment using elastic beanstalk configuration files (ex- you can define packages to install, create linux users and groups, run shell commands, specify services to enable or configure your load balancer, etc)
- These are files written in YAML or JSON format.
- They can have a filename of your choice but must have .config extension and be saved inside a folder called .ebextensions
- Location of configuration files
  - The .ebextensions folder must be included in the top-level directory of your application source code bundle
  - This means that the configuration files can be placed under source control along with the rest of your application code

---

# RDS & Elastic Beanstalk

- Elastic Beanstalk supports two ways of integrating an RDS db with your beanstalk environment.
- You can launch the RDS instance from within the Elastic Beanstalk console, which means the RDS instance is created within your elastic beanstalk environment - a good option for dev and test deployments
- However this may not be ideal for production environments bcoz- it means the lifecycle of your db is tied to the lifecycle of your application environment. So if you terminate the environment, the db instance will be terminated too.
- For production environments , the preferred option is to decouple the RDS instance from your EBS environment i.e- launch it outside of Elastic Beanstalk, directly from the RDS section of the console.
- This option gives you a lot more flexibility, allows you to connect multiple environemts to the same db, provides a wider choice of db types, and allows you to tear down your application environment without affecting the db instance
- Access to RDS from EBS
  - To allow the EC2 Instances in your Elastic Beanstalk environment to connect to an outside db, there are 2 additional configuration step required:
    - An additional Security Group must be added to your environments auto scaling group.
    - You'll need to provide connection string configuration information to your application servers (endpoint, password using Elastic Beanstalk environment properties)
- Exam Tip:
  - 2 different options for launching your RDS instance:
  - Launch within EBS
    - When you terminate the EBS environment, the db will also be terminated
    - Quick and easy to add your db and get started
    - Sutiable for Dev and Test environemts only
  - Launch outside of EBS
    - Additional configuration steps required - Security Group and Connection information
    - Suitable for production environemts, more flexibility
    - Allows connection from multiple environemts, you can tear down the application stack without impacting the db
