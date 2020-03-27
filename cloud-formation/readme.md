# Creating stack using cloud formation

- \$ nano ec2-template.yml
- \$ aws cloudformation create-stack --stack-name tsabunkar-ec2 --template-body file://ec2-template.yml (To create ec2 stack)
- \$ aws cloudformation describe-stacks --stack-name tsabunkar-ec2
- (Parameters are a way to provide inputs to a template and changes what the template does)
- \$ aws cloudformation create-stack --stack-name tsabunkar-ec2-2 --template-body file://ec2-temp-2.yml --parameters file://params.json [ In the run time I am able to add the ec2 Instance type from t2.micro --> t2.small ]
- \$ aws cloudformation describe-stacks --stack-name tsabunkar-ec2-2
- Management & Governance > CloudFormation
- ( You can also view in the cloud formation stack designer)

---

Resource :

https://blog.boltops.com/2018/02/14/aws-cloudformation-declarative-infrastructure-code-tutorial

https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/gettingstarted.templatebasics.html#gettingstarted.templatebasics.multiple

https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html

https://docs.amazonaws.cn/en_us/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html#parameters-section-structure-defining
