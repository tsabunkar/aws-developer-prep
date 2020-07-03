# ElasticBeanStalk-

## Depolying Applications With Elastic Beanstalk

- Services > Compute > Elastic Beanstalk
- Create Application
- Create a web app
  - Application name : helloCloudGuru
  - Platform : PHP
  - Application code : (Select) Upload your code
  - Source code origin : (Select) Choose file --> Upload zip file [./original-src-code.zip]
  - Create Application (Take 5mins)
  - http://hellocloudguru-env.eba-spptmcav.us-east-1.elasticbeanstalk.com/ (Web app)
  - Go to EC2 - (you can see a new instance has been started by this bean stalk and its running)

---

## Updating Elastic Beanstalk (Uploading Version of Application)

- Service > Elastic Beanstalk > Applications (tab)
- (Select require enviro) Actions > View Application versions
- Upload Btn
  - Version label : hellocloudguru-source-2
  - Decription : Version-2 of application
  - (Upload new version of the application - modifiy some file)
  - Upload
- Applications > (click) helloCloudGuru > Hellocloudguru-env
- Configuration (tab)
- Rolling updates and deployments > Edit
  - Deployment policy : At all once (2 options)
- (To deploy new application version)
  - Applications > (click) helloCloudGuru
  - Application version (tab)
  - (select) hellocloudguru-source-2
  - Actions > Deploy
  - Deploy
- To delete above application
  - Applications > (click) helloCloudGuru
  - Actions > Delete application
  - Delete

---

# Kinesis

- Service > Management & Governance > CloudFormation
- Create Stack
  - Prepare template: Template is ready
  - Specify template: Amazon S3 URL -> http://s3.amazonaws.com/kinesis-demo-bucket/amazon-kinesis-data-visualization-sample/kinesis-data-vis-sample-app.template
  - Next
  - Stack name > MyKinesisStack > Next
  - (Default)
  - Create Stack
  - (10-15 mins to create the stack)
- (select) MyKinesisStack
  - Outputs
  - URL: http://ec2-35-174-77-165.compute-1.amazonaws.com
  - (Simulate of sample application)
- Services > EC2 > (See a instance running)
- Services > Analytics > Kinesis
  - Data streams (tab) > Configuration (tab) - (see details of shards)
- Services > Database > DynamoDB > Tables - (see tables are created)
- TO Delete this cloudformation:
  - (select) MyKinesisStack
  - Delete

---

# Elastic Beanstalk & Docker Containers

- Elastic Beanstalk > Environments
- Applications (tab)
- Create a new environment
- Web server environment
- Application name: my-docker-app
- Platform: Docker
- Application code
  - Upload your code: Local file ([./docker/docker-singlecontainer-v1.zip])
- create environment
- Elastic Beanstalk > Environments > MyDockerApp-env
- MyDockerApp-env.eba-gkaufme5.us-east-1.elasticbeanstalk.com (click on link)
