# CloudFormation LAB

- Services > Management & Governance > CloudFormation
- Create stack
  - Prerequisite - Prepare template : Template is ready
  - Specify template: Upload a template file (choose file - [./CloudFormationTemplate.yml])
  - (you can view in Designer)
  - Next
  - Stack name : test-stack
  - KeyName: myNewKeyPair
  - Next
  - create stack

---

# CloudFormation & SAM Lab

- (Deploying Lambda function using Cloudformation and SAM CLI)
- Installing SAM CLI in you machine (Follow doc from Step 4: Install Homebrew)
  - $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" (Install brew)
  - $ test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
  - $ test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  - $ test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
  - $ echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
  - \$ brew --version
  - \$ brew tap aws/tap
  - \$ brew install aws-sam-cli
  - \$ sam --version
- Configurations Steps
- \$ aws iam get-user
- (Make sure this devUser1 has AmazonS3FullAccess permission)
- \$ aws s3 mb s3://cloudformation-tsabunkar --region us-east-1 (make s3 bucket)
- (SAM command to package up the code and upload to S3 bucket)
  - \$ cd /home/tejas/tejas/workspace/vsc/aws-developer-prep/cloud-formation/lambda-cloudformation
  - \$ ll (Check you can see files - index.js and lambda.yml)
  - \$ sam package \
    --template-file ./lambda.yml \
    --output-template-file sam-template.yml \
    --s3-bucket cloudformation-tsabunkar
- \$ ( Above command will create a file - sam-template.yml )
- (SAM command to deploy, deploy lambda function using CloudFormation)
  - \$ sam deploy \
    --template-file sam-template.yml \
    --stack-name test-stack \
    --capabilities CAPABILITY_IAM
  - (If ERROR- user/devUser 1 is not authorized to perform: iam:CreateRole on resource ==> Give AdministratorAccess to devUser1) [Then retry above command]
- AWS Lambda > Functions (Check this function is created by Cloudformation)

---

- REF:
- https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-linux.html
- https://brew.sh/
- https://github.com/homebrew/install#uninstall-homebrew (Uninstall brew)

---
