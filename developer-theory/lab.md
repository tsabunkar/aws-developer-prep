# CodeCommit

- Services > Developer Tools > CodeCommit
- Create repository
  - Repository name : test-aws-developer-prep
  - Create
- Clone URL > Clone HTTPS
- ( Copied url -> https://git-codecommit.us-east-1.amazonaws.com/v1/repos/test-aws-developer-prep )
- (Open url local CLI)
- \$ cd /tejas/workspace
- \$ git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/test-aws-developer-prep
- [
  ERROR: 403 -> The requested URL returned error: 403
  git config --global credential.helper '!aws codecommit credential-helper $@'
  git config --global credential.UseHttpPath true
  ]
- \$ cd test-aws-developer-prep
- \$ echo "Hello-world" > Readme.md
- \$ cat Readme.md
- \$ git status
- \$ git add .
- \$ git commit -m "First Commit"
- \$ git push -u origin master
- (To create branch using aws web app)
  - Branches (tab)
  - Create branch
  - Branch name : dev
  - Branch from : master
  - Create branch
- Create pull request
  - (Define Destination Source)
  - Compare
  - Create pull request
  - Merge
  - Fast forward merge
  - Merge pull request

---

# CodeDeploy

- (Creating Required IAM Roles)
  - Services > Security, Identity, & Compliance > IAM
  - Roles (tab) > Create Role
  - Select type of trusted entity: AWS service
  - Choose a use case: (select) EC2 > Next
  - Filter policies: AmazonS3FullAccess (select)
  - Role name: myS3roleForCodeDeploy > Create role
  - Roles (tab) > Create Role
  - Select type of trusted entity: AWS service
  - Or select a service to view its use cases: (select) CodeDeploy
  - Select your use case: (select) CodeDeploy
  - Attached permissions policies- AWSCodeDeployRole
  - Role name: cdServiceRole > Create role
- (Creating EC2 Instance)
  - Configure Instance Details
    - IAM role: (select) myS3roleForCodeDeploy
    - Next
  - Add Tags
    - Key: AppName, Value: myWebApp
  - Configure Security Group
    - Select an existing security group: myWebDMZ
  - Lanuch Instance
- (Login locally using CLI to AWS EC2 Instance created)
  - (run commands - [./assets/commands-code-deploy.sh])
- (Locally - Configure AWS CLI it will Act as developers machine and we can deploy the code )
  - EC2 > IAM
  - Users (tab) > Add user
  - User name: devUser1
  - Access type: Programmatic access
  - Set permissions: (Select) Attach existing policies directly
  - policy : (select) AWSCodeDeployFullAccess and AmazonS3FullAccess
  - Create User
  - Copy the -> Access Key ID and Secret access key (Useful to login from local CLI as developer)
  - (Back to your terminal) > cd ~
  - \$ aws configure
  - (Paste the Access Key ID and Secret access key )
  - Service > S3
  - create bucket
  - Bucket name: cd-bucket-tsabunkar > create bucket
  - (Back to terminal) -> (Create your application.zip and load it into CodeDeploy)
  - \$ aws deploy create-application --application-name mywebapp
  - \$ cd /home/tejas/tejas/workspace/vsc/aws-developer-prep/developer-theory/assets/webapp
  - \$ aws deploy push --application-name mywebapp --s3-location s3://<MY_BUCKET_NAME>/<src_path_for_webapp.zip> --ignore-hidden-files
  - \$ aws deploy push --application-name mywebapp --s3-location s3://cd-bucket-tsabunkar/webapp.zip --ignore-hidden-files
  - (Thus a zip file is pushed/uploaded to S3 bucket) ==> (To Verify -> Amazon S3 > cd-bucket-tsabunkar)
- Deployment
  - Services > Developer Tools > CodeDeploy
  - Applications (tab) -> (should see the application was created by CLI here -> mywebapp)
  - (select) mywebapp
  - Deployment Groups (tab)
  - Create deployment group
  - Enter a deployment group name: mydg
  - Service role: (select) arn:aws:iam::494039644227:role/cdServiceRole (Servicle Role created previously in IAM)
  - Deployment type: In-place
  - Environment configuration: Amazon EC2 instances
    - Key: AppName, Value: myWebApp (Tag created previously)
  - Load balancer: (de-select) Enable load balancing
  - Create deployment group
  - Applications > mywebapp > mydg > (Click) Create deployment
  - Deployment settings
    - Revision location: s3://cd-bucket-tsabunkar/webapp.zip?eTag=8d97a49e9e76d1322f8a1704e70cb1c1
    - Create Deployment
- To Verify CD had been successfully and our pages are hosted
  - Services > EC2
  - Running Instances > (select) Instances
  - Copy+paste the IPv4 Public IP ==> 18.234.249.10 (in browser) [Thus EC2 instance is serving this website]

---

# CodePipeLine Lab

- [.assets/code-pipeline.png]
- Services > S3 > Create bucket
- Bucket name: cf-template-tsabunkar
- (select) cf-template-tsabunkar
- upload
- (Upload CF_Template.json file ->[.assets/CF_Template.json])
- Services > IAM
- Policies (tab)
- Create Policy > (select) JSON (tab)
- (copy + paste the policy -> [.assets/cloud-formation-access-policy.json])
- Review policy
  - Name : CF-Access
  - Create policy
- Users (tab) > (select) devUser1
- Add permissions > Attach existing policies directly
  - Filter policies : (select) Customer managed
  - (select) CF-Access
  - Next > Add Permission
- Local CLI without
  - \$ aws iam get-user (devUser1 -> Created in above lab)
  - \$ aws configure list
  - \$ aws cloudformation create-stack --stack-name CodeDeployDemoStack \
     --template-url <S3_bucket_CF-Template-json_url> \
     --parameters ParameterKey=InstanceCount,ParameterValue=1 \
     ParameterKey=InstanceType,ParameterValue=t2.micro \
     ParameterKey=KeyPairName,ParameterValue=<keyPairValue> \
     ParameterKey=OperatingSystem,ParameterValue=Linux \
     ParameterKey=SSHLocation,ParameterValue=0.0.0.0/0 \
     ParameterKey=TagKey,ParameterValue=Name \
     ParameterKey=TagValue,ParameterValue=CodeDeployDemo \
     --capabilities CAPABILITY_IAM
    - [ <S3_bucket_CF-Template-json_url> ==> https://cf-template-tsabunkar.s3.amazonaws.com/CF_Template.json (Object URL from the uploaded file) ]
    - [ Services > EC2 > Network & Security (tab) > Key Pairs, <keyPairValue> ==> myNewKeyPair ]
    - (Check- [.assets/code-pipeline.sh])
  - \$ aws cloudformation describe-stacks --stack-name CodeDeployDemoStack --query "Stacks[0].StackStatus" --output text
    - (If it gives : CREATE_IN_PROGRESS wait until it gives : CREATE_COMPLETE)
- Create CodePiple Bucket in S3
  - Services > S3 > Create Bucket
  - Bucket name: code-pipline-bucket-tsabunkar
  - Create Bucket
  - (select) code-pipline-bucket-tsabunkar
  - Properties (tab) > Versioning > (select) Enable versioning > Save
  - Overview > Upload
  - ( Upload the ZIP File mywebapp.zip, which is under [./assets/mywebapp_1.0/mywebapp.zip])
- Services > EC2 > Running Instance
- (select) CodeDeployDemo [which was created by CloudFormation Command which we ran]
  - Connect to your instance -> \$ ssh -i "myNewKeyPair.pem" ec2-user@ec2-54-237-109-41.compute-1.amazonaws.com
  - \$ sudo service codedeploy-agent status (The AWS CodeDeploy agent is running as PID 2976)
- Services > Developer Tools > CodeDeploy
  - Getting started > Create application
  - Application configuration
    - Application name: codepipeline-mywebapp
    - Compute platform: EC2/On-premises
    - create application
  - Deployment groups (tab)
  - Create deployment group
    - Enter a deployment group name: mydg
    - Enter a service role: arn:aws:iam::494039644227:role/cdServiceRole
    - Deployment type: In-place
    - Environment configuration: Amazon EC2 instances
      - Key: , Value:
        (
        To verify the key&value of EC2 ==>
        - Services > EC2 > Running Instance
        - (select) CodeDeployDemo
        - Tags (tab)
        - Key-Name , Value-CodeDeployDemo
          )
    - (de-select) Enable load balancing
    - Create deployment group
  - Create deployment
    - Revision location: (Type S3 bucket location, where we have uploaded the zip file) s3://code-pipline-bucket-tsabunkar/mywebapp.zip
    - create deployment
  - (To verify the deployment is succeded)
    - Service > EC2 > Running Instance > Running Instance >
    - IPv4 Public IP -> 54.237.109.41 (open this Ip in new tab)
- (To Configure Code Pipeline)
  - Services > Developer Tools > CodeDeploy
  - Pipeline > Getting started
  - Create pipeline
  - Pipeline name: mypipeline
  - Next
  - Source
    - Source provider : Amazon S3
    - Bucket: code-pipline-bucket-tsabunkar
    - S3 object key: mywebapp.zip
    - next
  - Build provider (We can use Jenkins or AWS CloudBuild, but now lets go with default)
    - Skip build stage
  - Add deploy stage
    - Deploy provider: AWS CodeDeploy
    - Application name: codepipeline-mywebapp
    - Deployment group: mydg
  - create pipeline
  - (Once pipeline setup is successful)
- (To verify CD pipeline)
  - Services > S3 > (select) code-pipline-bucket-tsabunkar
  - Upload the same folder making some changes in index.html -> [./assets/mywebapp_1.0/mywebapp.zip]
  - Goto Pipelines (Thus our CD pipeline has deducted there was change in S3 bucket so kicked of new pipeline )
  - Visit - http://54.237.109.41/ (See your changes)

---
