# Cloud History

- Data Centre
- IAAS (Infra-structure as a Service) - EC2 Instnace launched in 2006
- PAAS (Platform as a Service) - elastic beanstalk
- Containers - Docker and kubernetes
- Serverless - aws Lambda function (used by Alexa when we speak)

- REF:
  - https://read.acloud.guru/serverless-the-future-of-software-architecture-d4473ffed864

---

# What is Lambda ?

- AWS lambda is complete abstraction over :
  - Data centers
  - Hardware
  - Assembly Code/Protocols
  - High Level languages
  - Operating Systems
  - Application Layer/ AWS APIs
- AWS Lambda is a compute service where you can upload your code and create a lambda function. AWS lambda take care of provisioning and managing the servers that you use to run the code.
  - You don't have to worry about operating systems, patching, scaling, etc
- You can use lambda is following ways:
  - As an event-driven compute service where AWS Lambda runs your code in response to events. These events could be changes to data in an Amazon S3 bucket or an Amazon DynamoDB table. ==> Called triggers
  - As a compute service to run your code in response to HTTP request using Amazon API Gateway or API Calls made using AWS SDKs.
- Languages Supported by Lambda:
  - Nodejs
  - Java
  - Python
  - C#
  - Go
- Lambda Price:
  - Number of requests
    - First 1 million requests are free, \$0.20 per 1 million requests thereafter
  - Duration
    - Duration is calculated from the time your code begins executing until it returns or otherwise terminates, rounded up to the nearest 100ms. ==> TIME COMPLEXITY (not excatly but nearly)
    - The price depends on the amount of memory you allocate to your function. You are charged \$0.00001667 for every GB-second used. ==> SPACE COMPLEXITY
- Why lambda is cool
  - NO SERVERS required
  - Continous Auto Scaling
  - Super Cheap

# Lambda Exam Tip

- Lambda scales out (Can run parallel functions) automatically, not scale-up (run out of memory can be scaled automatically) .
- Lambda function are independent, 1event = 1 function
- Lambda is serverless
- Service which are serverless in AWS- Lambda, API Gateway, DynamoDB, S3, etc
  - EC2 is not serverless
  - RDS is not serverless, but Aurora is serverless
- Lambda functions can trigger other lambda functions, 1 event can trigger any number of functions (if functions trigger other functions).
- Architectures can get extremely complicated, AWS X-ray allows you to debug what is happening in AWS lambda
- Lambda can do things globally, you can use it to back up S3 buckets to other S3 buckets etc.
- Know your triggers

---

# API Gateway

- What is API
  - An API is an Applications programming Interface
  - Check images
- Types of APIs
  - REST APIs (Representational State Transfer) which uses JSON
  - SOAP APIs (Simple Object Access Protocol) which uses XML
- API Gateway:
  - is a fully managed service that makes it easy for developers to publish, maintain, monitor and secure APIs at any scale.
  - With few clicks in the AWS Management console you can create an API that acts as a "front door" [As your waiter, check api-gateway image] for applications to access data, business logic, or functionality from your back-end services, such as applications running on EC2, code running on Lambda or any web applications.
  - Ex: \$ curl "https://isrospacex.com/launches.json"
- What can API Gateway do ?
  - Expose HTTPs endpoints to define a RESTful API
  - Serverless-ly connect to service like lambda & DynamoDB
  - Send each API endpoint to a different target (i.e.- one endpoint to lambda, one endpoint to dynamo db, one end point ec2, etc)
  - Run efficiently with low cost
  - Scale effortlessly
  - Track and control usage by API key
  - Throttle requests to prevent attacks (prevent ddos attack)
  - Connect to cloudwatch to log all requests for monitoring
  - Maintain multiple versions of your API
- How to configure API Gateway
  - Define an API (container)
  - Define Resources and nexted Resources (URL paths)
  - For each resource:
    - Select supported HTTP methods (verbs)
    - Set security
    - Choose target (such as EC2, Lambda, DynamoDB, etc)
    - Set request and response transformations
  - Deploy API to a Stage
    - Uses API Gateway domain, by default
    - Can use custom domain
    - now support AWS Certificate manager: free SSL/TLS certificate (if you have bought Route 53)
- What is API Caching ?
  - You can enable API caching in Amazon API Gateway to cache your endpoint's response. With caching, you can reduce the number of calls made to your endpoint and also improve the latency of the requests to your API.
  - When you enable caching for a stage, API Gateway caches responses from your endpoint for a specified time-to-live (TTL) period, in seconds.
  - API Gateway then responds to the request by looking up the endpoint response from the cache instead of making a request to your endpoint.
  - THink API Cache as - Mcdonalds where your order cheese burger the service guy just give you which is already avaliable, but if you order salad then service guy gives order to backend i.e- chef they make it and service you back after some time. This Mcdonalds had cached commonly order food items like cheese burger so that it can serviced very fast
- Same Origin Policy
  - In computing, the same-origin policy is an important concept in the web application security model. Under the policy, a web browser permits scripts contained in a first web page to access data in a second web page, but only if both web pages have the same origin.
  - This done to prevent Cross-Site Scripting (XSS) attacks
  - Enforced by web browsers
  - Ignored by tools like Postman Curl.
- Cross Origin Resource Sharing (CORS)
  - CORS is one way the server at the other end (not the client code in the browser) can relax the same-origin policy.
  - CORS is a mechanism that allows restricted resource (ex: fonts) on a web page to be requested from another domain outside the domain from which the first resource was served.
  - Browser makes an HTTP OPTIONS call for a URL
    - OPTIONS is an HTTP method like: GET, PUT and POST
  - Server returns a response that says:
    - "These other domains are approved to GET this URL"
  - Error : "Origin policy cannot be read at the remote resource?"
    - Solve : You need to enable CORS on API Gateway

# Exam Tips

- Remember what API Gateway is at a high level
- API Gateway has caching capabilities to increase performance
- API Gateway is low cost and scales automatically
- You can throttle API Gateway to prevent attacks.
- You can log results to CloudWatch
- If you are using JS/AJAX that uses multiple domains with API Gateway, ensure that you have enabled CORS on API Gateway
- CORS is enforced by the client by default.

---

# Version with Lambda

- Versioning
  - When you use versioning in AWS Lambda, you can publish one or more versions of your lambda function. As a result, you can work with different variations of your lambda function in your development workflow, such as development, beta, and production
  - Each lambda function version has a unique Amazon Resource Name (ARN). After you publish a version, it is immutable (that is, it cannot be changed)
  - AWS lambda maintains your latest function code in the $LATEST version. When you update your funcion code, AWS Lambda replaces the code in the $LATEST version of the Lambda function.
- Qualified/Unqualified ARNs
  - You can refer to this function using its Amazon Resource Name (ARN). THere are 2 ARNs associated with this initial version:
    - Qualified ARN:
      - The function ARN with the version suffix.
      - $ arn:aws:lambda:aws-region:acct-id:function:helloworld:$LATEST
    - Unqualified ARN:
      - The function ARN without the version suffix
      - arn:aws:lambda:aws-region:acct-id:function:helloworld
- Alias
  - After intially creating a lambda function (the \$LATEST version), you can publish a version 1 of it. By creating an alias named PROD that points to version 1, you can now use the PROD alias to invoke version 1 of the lambda function.
  - Now, you can update the code (the \$LATEST version) with all of your improvements, and then publish another stable and improved version (version2). You can promote version2 to production by remapping the PROD alias so that it points to version2. If you find something wrong, you can easily roll back the production version to version1 by remapping the PROD alias so that it points to version1.

---

# Exam Tips fo Version Control with Lambda

- Can have multiple versions of lambda functions
- Latest version will use \$LATEST
- Qualified version will use \$LATEST, unqualified will not have it
- Versions are immutable in nature (Cannot be changed/edited)
- Can split traffic using aliases to different versions
  - NOTE: Cannot split traffic with \$LATEST, instead create an alias to latest.

---

# Advnace API Gateway

## Import APIs

- You can use the API Gateway Import API feature to import an API from an external definition file into API Gateway. Currently, the import API feature supports Swagger v2.0 definition files.
- With the Import API, you can either create a new API by submitting a POST request that includes a Swagger definition in the payload and endpoint configuration, or you can update an exisiting API by using a PUT request that contains a swagger definition in the payload. - You can update an API by overwritting it with a new definition or merge a definition with an existing API. You specify the options using a mode query parameter in the request URL.

## API Throttling

- By default, API Gateway limits the steady-state request rate to 10,000 requests per second(rps)
- The maximum concurrent requests is 5000 requests across all APIs within an AWS account.
- If you go over 10,000 requests per second or 5000 concurrent requests you will recieve a "429 Too Many Requests" error repsonse.
- Examples :
  - If a caller submits 10,000 requests in a one second period evenly (for example, 10 requests every millisecond), API Gateway processes all requests without dropping any.
  - If the caller sends 10,000 requests in the first millisecond, API Gateway serves 5,000 of those requests and throttles the rest in the one-second period.
  - If the caller submits 5,000 requests in the first millisecond and then evenly spreads another 5,000 requests through the reamining 999 milliseconds (for example, about 5 requests every millisecond), API Gateway processes all 10,000 requests in the one-second period without returning 429 too many requests error responses.

## SOAP Webservice Passthrough

- You can configure API Gateway as a SOAP web service passthrough

---

# Examp Tips on Advanced API Gateway

- Import API's using Swagger 2.0 definition files
- API Gateway can be throttled
  - Default limits are 10,000 RPS or 5000 concurrently
- You can configure API Gateway as a SOAP webservice passthrough

---

# Summary

- Lambda
  - Lambda scales out (not up) automatically
  - Lambda functions are independent, 1 event = 1 function
  - Lambda is serverless
  - Know what services are serverless
  - Lambda functions can trigger other lambda functions, 1 event can = x functions if functions trigger other functions
  - Architectures can get extremely complicated, AWS X-ray allows you to debug what is happening
  - Lambda can do things globally, you can use it to back up S3 buckets to other S3 buckets etc
  - Know your triggers
- API Gateway
  - Remeber what API Gateway is at a high level
  - API Gateway has caching capabilities to increase performance
  - API Gateway is low cost and scales automatically
  - You can throttle API Gateway to prevent attacks
  - You can log results to CloudWatch
  - If you are using Javascript/AJAX that uses multiple domains with API Gateway, ensure that you have enabled CORS on API Gateway
  - CORS is enforced by the client.
- Version Control
  - Can have multiple versions of lambda functions
  - Latest version will uses \$LATEST
  - Qualified version will use \$LATEST, unqualified will not have it
  - Versions are immutable in nature(Cannot be changed/modified/edited)
  - Can split traffic using aliases to different versions
    - Cannot split traffic with \$LATEST, instead create an alias to latest.
- Step Functions
  - Great way to visualize your severless application
  - Step functions automatically triggers and tracks each step.
  - Step functions logs the state of each step so if something goes wrong you can track what went wrong and where.
- X-Ray
  - X-Ray SDK provides:
    - Interceptors to add to your code to trace incoming HTTP requests
    - Client handlers to instrument AWS SDK client that your applications uses to call other AWS services.
    - An HTTP client to use to instrument calls to other internal and extenral HTTP web services.
  - X-Ray Integrates with following AWS Services:
    - Elastic Load balancing
    - AWS Lambda
    - Amazon API Gateway
    - Amazon Elastic Compute Cloud
    - AWS Elastic Beanstalk
  - Lnguages integrates: Java, GO, Nodejs, pythong, Ruby, .net

---

# Lambda Concurrent Executions Limit

- Concurrent Executions
  - Not necessary to memoruze lots of limits for the exam
  - Be aware that there is a concurrent execution limit for Lambda
  - Safety feature to limit the number of concurrent executions across all functions in a given region per account
  - default is 1000 per region
  - TooManyRequestsException
  - HTTP Status Code:429
  - Request throughput limit exceeded
  - If you have many Lambda functions running in the same region and you suddenly start seeing new invocation requests being rejected, then you may have hit your limit
  - Request an increase on this limit by submitting a request to the AWS Support Center
  - Reserved concurrency guarantees that a set number of executions which will always be avaliable for your critical function, however this also acts as a limit

---

# Lambda Version

- When you create a Lambda funcion, there is only one version: \$LATEST
- When you upload a new version of the code to lambda, this version will become \$LATEST
- You can create multiple versions of your function code and use aliases to reference the version you want to use as part of the ARN
- ex- In a development environment you might want to maintain a few versions of the same function as you develope and test your code
- An alias is like a pointer to a specific version of the function code
- [./assets/lambda-version.png]
- [./assets/lambda-version-2.png]

---

# Lambda and VPCs

- Some use cases require Lambda to access resources which are inside a private VPC
- ex- read or write to an RDS database, or shutdown an EC2 instance in response to a security alert
- [./assets/lambda-VPC.png]
- Enabling Lambda to Access Your VPC Resources
  - To enable this, you need to allow the function to connect to the private subnet
  - Lambda needs the following VPC configuration information so that it can connect to the VPC:
    - Private subnet ID
    - Security group ID (with required access)
    - Lambda uses this information to set up ENIs using an avaliable IP address from your private subnet
  - You add VPC information to your lambda function config using the vpc-config parameter.
  - \$ aws lambda update-function-configuration --function-name my-function --vpc-config SubnetIds=subent-1122aabb,SecurityGroupIds=sg-51530134
