# 1. To create your EC2 instance using CloudFormation,
aws cloudformation create-stack --stack-name CodeDeployDemoStack \
--template-url https://cf-template-tsabunkar.s3.amazonaws.com/CF_Template.json \
--parameters ParameterKey=InstanceCount,ParameterValue=1 \
ParameterKey=InstanceType,ParameterValue=t2.micro \
ParameterKey=KeyPairName,ParameterValue=myNewKeyPair \
ParameterKey=OperatingSystem,ParameterValue=Linux \
ParameterKey=SSHLocation,ParameterValue=0.0.0.0/0 \
ParameterKey=TagKey,ParameterValue=Name \
ParameterKey=TagValue,ParameterValue=CodeDeployDemo \
--capabilities CAPABILITY_IAM

# 2. Verify that the Cloud Formation stack has completed using:
aws cloudformation describe-stacks --stack-name CodeDeployDemoStack --query "Stacks[0].StackStatus" --output text

# 3. Log in to your instance and check that the CodeDeploy agent has correctly installed:  
sudo service codedeploy-agent status
