# What is X-Ray ?

- AWS X-Ray is a service that collects data about requests that your application serves, and provides tools you can use to view, filter, and gain insights into that data to identify issues and opportunities for optimzation.
- For any traced request to your application, you can see detailed information not only about the request and response, but also about calls that your application makes to downstream AWS resources, microservices, databases and HTTP web APIs

## X-Ray SDK

- The X-Ray SDK provides:
  - Interceptors to add to your code to trace incoming HTTP requests
  - Client handlers to instrument AWS SDK clients that your application uses to call other AWS services
  - An HTTP client to use to instrumentcalls to other internal and external HTTP web services.

## X-Ray Integration

- The X-Ray Integrates with the following AWS services:
  - Elastic Load Balancing
  - AWS Lambda
  - Amazon API Gateway
  - Amazon Elastic Compute Cloud
  - AWS Elastic Beanstalk

## X-Ray Languages

- Java
- Go
- Nodejs
- Python
- Ruby
- .Net

---

# Lab

- https://console.aws.amazon.com/elasticbeanstalk/home?region=us-east-1#/newApplication?applicationName=scorekeep&solutionStackName=Java
- Create application
- (done) click -> http://scorekeep-env.eba-wjpmzahf.us-east-1.elasticbeanstalk.com/
- (This will check the health of EC2)

---

# Exam Tip

- The X-Ray SDK provides
  - Interceptor to add your code to trace incoming HTTP requests.
  - Client handlers to instrument AWS SDK clients that your application uses to call other AWS services.
  - An HTTP client to use to instrument calls to other internal and external HTTP web services.
- The X-Ray Integrates with the following AWS services:
  - Elastic Load Balancing
  - AWS Lambda
  - Amazon API Gateway
  - Amazon Elastic Compute cloud
  - AWS Elastic Beanstalk

---

# To Terminate Elastic Bean Stalk -

- Elastic Beanstalk > Environments
- (Select the environment to terminate) -> Actions > Terminate environment
