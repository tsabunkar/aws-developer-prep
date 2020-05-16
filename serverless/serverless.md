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
