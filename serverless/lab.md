# First Serverless and API Gateway

- Arch: ./assets/serverless-arch-practice.png
- S3 bucket > Create Bucket > tsabunkarmaths.com
- (Select) tsabunkarmaths.com bucket > Properties > Static website hosting
  - Use this bucket to host a website
  - Index Document: index.html, Error Document: error.html
  - Save
- Service > Compute > Lambda
  - Create Function
  - Author from scratch
    - Function name : MyServerlessWebsite
    - Runtime : Python 3.6
    - Choose or create an execution role
      - Create a new role from AWS policy templates
    - Role name : myLambdaRole
    - Policy Templates : Simple Microservice Permissions
  - Create Function
- Function code : (section)
  - Copy paste the code from .code-base/hello.py to -> function code
- Designer : (section)
  - Add trigger
  - (select) API Gateway
    - API type: REST API
    - Security: Open
    - Add
- Select API Gateway
  - Under API Gateway (section)
  - (click) MyServerlessWebsite-API (in new tab)
- (You can actual vizualize the API Gateway & Lambda function arch) [./assets/api-gateway-view.png]
  - Actions > Delete Method
  - Delete
  - Actions > Create Method
  - (select) GET
  - /MyServerlessWebsite - GET - Setup
    - Integration type : Lambda Function
    - Use Lambda Proxy integration: Check
    - Lambda Function : MyServerlessWebsite
    - Save
    - Add Permission to Lambda Function : OK
  - Actions > Deploy API
    - Deployment stage: [New Stage]
    - Stage name\* : prod
    - Stage description : production
    - Deployment description : My First Prod Deployment
    - Deploy
- Stages (Tab)
  - prod - GET - /MyServerlessWebsite
  - Invoke URL: https://ajyxigsr92.execute-api.us-east-1.amazonaws.com/prod/MyServerlessWebsite
  - Click on above URL (You will see your name)

---

## Doing Curl command for api-gateway url/end-point from EC2 Instance

- cd ~/tejas/other-apps/amazon-aws/689b24d (Place where you have myNewKeyPair.pem file)
- chmod 400 myNewKeyPair.pem
- ssh -i "myNewKeyPair.pem" ec2-user@ec2-3-81-110-142.compute-1.amazonaws.com
- (Above steps you can find: Services > EC2 > Running Instance > Select Instance > Connect)
- curl "https://ajyxigsr92.execute-api.us-east-1.amazonaws.com/prod/MyServerlessWebsite"
- curl "https://ajyxigsr92.execute-api.us-east-1.amazonaws.com/prod/MyServerlessWebsite" > myname.txt
- nano myname.txt
- cat myname.txt

---

## Configuring Api-gateway & lambda with S3 bucket (used for static web site hosting)

- copy paste the api-gateway url/endpoint in ./code-base/index.html
- Goto S3 > tsabunkarmaths.com (bucket which you have created)
- Permission > Block all public access (off) [make this bucket public]
- Upload > (add error.html and index.html files into this bucket)
- Manage public permissions : Grant public read access to this object(s)
- Upload (these files)
- Goto : S3 > select the bucket > Properties > Static website hosting > Endpoint : http://tsabunkarmaths.com.s3-website-us-east-1.amazonaws.com
- Vist this index.html url

---

# Alias in Lambda function

- Service > Lambda > Create Function > Author from scratch
  - Function name : myNewFunction
  - Runtime : Nodejs 12.x
  - Execution role: Use an existing role
    - Existing role: service-role/myLambdaRole
  - Create function
- Function code :
- (change text: Hello Version-1)
- Qualifiers > Version
- \$LATEST --> (Show the latest code base)
- (To create new version of our code)
- Actions > Publish new version
- Version description : Version 1 > Publish
- (Thus you have created a version of your code base, we cannot edit this Version 1 code base)
- Go to \$LATEST
- (change text: Hello Version-2, js is best lang)
- Actions > Publish new version
- Version description : Version 2
  (Thus we can see all our version of code - Version)
- (To create alias)
- Actions > create a new alias
- Alias configuration
  - Name: Version1-Old
  - Description: This is my oldest version of code
  - Version: (select) 1
  - Save
- (Thus we can see this in Aliases)
- Creating splits between traffic
- (You can shift traffic between two versions)
  - Actions > Create Alias
  - Alias configuration
    - Name : mySplitTraffic
    - Version: 2 , Weight (%) : 50
    - Weighted alias
      - Additional version : (select) 1
      - Weight (%) : 50
- (NOTE: You cannot create split traffic for \$LATEST version)

---

# Advance API Gateway

- Service > Networking & Content Delivery > API Gateway
- Create API
- Goto :
  - REST API
    (Develop a REST API where you gain complete control over the request and response along with API management capabilities.)
  - Import
- Import from Swagger or Open API 3
- Select Swagger file
  (Thus, we can import exisiting Swagger file while creating API Gateway)

---

# Lambda Version

- Lambda > Functions
- Create function
- Author from scratch
- Function name: my-lambda
- Runtime: Node
- Create function
- Function code
  - Actions
  - (select) Upload a .zip file [./version/v1.zip]
  - save
- Configure test event
- Event name: TE1 > create
- Test
- Qualifiers > (select) Version \$LATEST
- Actions > Publish new version > Publish
- Lambda > Functions > my-lambda
- Function code
  - Actions
  - (select) Upload a .zip file [./version/v2.zip]
  - (Change some code)
  - save
- Test
- Qualifiers > (select) Version \$LATEST
- Actions > Publish new version > Publish

---

# Lambda and VPCs

- Lambda > Functions
- Create function
- Author from scratch
- Function name: vpc-lambda
- Runtime: Node
- Create function
- Function code
  - Actions
  - (select) Upload a .zip file [./version/v1.zip]
  - save
- Configure test event
- Event name: TE1 > create
- Test
- VPC > Edit
  - Custom VPC:
    - (check - [.assets/vpc-selection.png])
    - Save
    - (Error: The provided execution role does not have permissions to call CreateNetworkInterface on EC2)
      (
      - Lambda > Functions > vpc-lambda
      - Edit basic settings
      - Execution role > Create a new role from AWS policy templates
      - Role name: vpc-lambda-role
      - save
        )
