# Introduction to CloudFormation

- CloudFormation is a service that allows you to manage, configure and provision your AWS infrastructure as code.
- Resources are defined using a CloudFormation template
- CloudFormation interprets the template and makes the appropriate API calls to create the resources you have defined
- Supports YAML or JSON
- CloudFormation Benefits
  - Infrastructure is provisioned consistently, with fewer mistakes
  - Less time and effort than configuring things manually
  - You can version control and peer review your templates
  - Free to use (charged for what you create)
  - Can be used to manage updates & dependencies
  - Can be used to rollback and delete the entire stack as well
- CloudFormation Template
  - YAML or JSON template used to describe the endstate of the infrastructure you are either provisioning or changing
  - After creating the template, you upload it to CloudFormation using S3
  - CloudFormation reads the template and makes the API calls on your behalf
  - The resulting resources are called a Stack
- CloudFormation Template Snippet: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/CHAP_TemplateQuickRef.html
- Resources is the only mandatory section of the CloudFormation template
- Remeber that the Transform section is used to reference additional code stored in S3, allowing for re-use ex- for Lambda code or template snippets / reusable pieces of CloudFormation code
- Exam Tips:
  - CloudFormation allow you to manage, configure and provision AWS infrastructure as code. (YAML/JSON)
  - Remeber the main section in the Cloud Formation Template:
    - Parameters- input custom values
    - conditions- ex: provision resources based on environment
    - Resources - (Mandatory) the AWS resources to create
    - Mappings - create custom mappings like Region: AMI
    - Transforms - reference code located in S3 ex- Lambda code or reusable snippets of CloudFormation code

---

# SAM (Serverless Application Model)

- Serverless Application Model is an extension to CloudFormation used to define serverless applications.
- Simplified syntax for defining serverless resources: APIs, Lambda Functions, DynamoDB Tables etc
- Use the SAM CLI to package your deployment code, upload it to S3 and deploy your serverless application
- Use the SAM CLI commands to package and deploy
  - sam package - packages your application and uploads to S3
  - sam deploy - deploys your serverless app using CloudFormation
