# IAM (Identity Access Managment)

- IAM allows you to manage users and their level of access to the AWS Console.
- It is important to understand for administrating a Companys AWS account.

# What does IAM give you ?

- Centralized control of your AWS account
- Shared Access to your AWS account
- Granular Permissions (Enable default level of access to different user)
- Identity Federation (including Acive Directory AD, Facebook, LinkedIn, etc) [Provides user to login with facebook, etc ]
- Multifactor Authentication (One way auth, two way authentication,Google auth token )
- Provides temporary access for users/devices and services, as necessary (Temporary access to S3 buckets or dynamo DB )
- Allows you to set up your own password rotation policy
- Integrates with many different AWS services.
- Supports PCI DSS Compliance. ( related to - Payment card industry )

---

# Terminologies used

- Users : End users who would be using our application (think people)
- Groups : A collection of users under one set of permissions. ( Groups of users who want to access dynamo DB, then we can create this group and make one of IT Admin as Admin of this group who can manage[create, delete] the tables in the dynamodb of that group )
- Roles : You create roles and can then assign them to AWS resources (Role has set of permissions)
- Policies : A document that defines one (or more) permissions (A policy can be attached to a user or group or role)

---

# MFA

- AWS Multi-Factor Authentication (MFA) is a simple best practice that adds an extra layer of protection on top of your user name and password.
- MFA enabled, when a user signs in to an AWS Management Console, they will be prompted for their user name and password (the first factor—what they know), as well as for an authentication code from their AWS MFA device (the second factor—what they have).
- Taken together, these multiple factors provide increased security for your AWS account settings and resources.
- You can enable MFA for your AWS account and for individual IAM users you have created under your account. MFA can be also be used to control access to AWS service APIs.

---

# Web Identity Federation

- Web Identity Federation lets you give your users access to AWS resources after they have successfully authenticated with a web-based identity provider like- Amazon, Facebook or Google
- Following successful authentication, the user receives an authentication code from the Web ID provider, which they can trade for temporary AWS security credentials.
- Amazon Cognito:
  - Amazon Cognito provides Wbe Identity Federation with the following features:
    - Sign-up and sign-in to your apps
    - Access for guest users
    - Acts as an Identity Broker between your application and Web ID providers, so you don't need to write any additional code
    - Synchronizes user data for multiple devices
    - Recommended for all mobiles applications AWS services
- Amazon Cognito Use Cases:
  - The recommended approach for Web Identity Federation using social media like Facebook
  - Cognito brokers between the app and FB or Google to provide temporary credentials which map to an IAM role allowing access to the required resources
  - No need for the application to embed or store AWS credentials locally on the device and it gives users a seamless experience across all mbile devices
- Exam Tips:
  - Federation allows users to authenticate with a Web Identity Providers (FB, Google, Amazon)
  - The user authenticates first with the Web ID Provider and receive an authentication token, which is exchanged for temporary AWS credentials allowing them to assume an IAM role
  - Cognito is an identity broker which handles interation b/w your application and the WebID provider (you don't need to write your own code to do this)
  - provides sign-up, sign-in and guest user access
  - Sync user data for a seamless experience across your devices
  - Cognito is the AWS recommended approach for Web ID Federation particualry for mobile apps

---

# Cognito User Pools

- User Pools
  - are user directories used to manage sign-up and sign-in in functionality for mobile and web applications
  - Users can sign-in directly to the User Pool, or indirectly via an identity provider like - FB, Amazon or Google.
  - Cognito acts as an Identity Broker b/w the ID provider and AWS
  - Successful authentication generates a number of JSON web tokens (JWTs)
  - [./user-pools.png]
- Identity Pools
  - enable you to create unique identities for your users and authenticate them with identity providers.
  - Within an identity, you can obtain temporary, limited-privilege AWS credentials to access other AWS services
- Cognito uses PUSH SYNCHRONIZATION
  - Cognito tracks the association b/w user identity and the various different devices they sign-in from
  - In order to provide a seamless user experience for your application, Cognito uses Push Synchronization to push updates and synchronize user data across multiple devices
  - Amazon SNS is used to send a silent push notification to all the devices associated with a given user identity whenever data stored in the cloud changes
- Exam Tips:
  - Cognito uses User pools to manage user sign-up and sign-in directly or via web identity provider
  - Cognito acts as an identity broker handling all interaction with web identity providers
  - Cognito uses Push Synchronization to send a silent push notification for user data updates to multiple device types associated with a User ID

---

# Advanced IAM Policies

- Identity Access Management (IAM) is used to define user access permissions within AWS
- There are 3 different types of IAM policies avaliable:
  - Managed Policies
  - Customer Manager Policies
  - Inline Policies
- Managed Policies:
  - A Managed Policy is an IAM policy which is created and administered by AWS.
  - AWS provide Managed Policies for common use cases based on job function ex- AmazonDynamoDBFullAccess, AWSCodeCommitPowerUser, AmazonEC2ReadOnlyAccess etc.
  - These AWS-provided policies allow you to assign appropriate permissions to your users, groups and roles without having to write policy yourself.
  - A single Managed Policy can be attached to multiple users, groups, or roles within the same AWS account and across different accounts.
  - You cannot change the permissions defined in an AWS Managed Policy.
- Customer Managed Policies
  - A Customer Managed Policy is a standalone policy that you create and administer inside your own AWS account.
  - You can attach this policy to multiple users, groups, and roles - but only within your own account.
  - In order to create a Customer Managed Policy, you can copy an exisiting AWS Managed Policy and customize it to fit the requirements of your organization.
  - Recommended for use cases where the exisiting AWS Managed Policies don't meet the needs of your environment
- Inline Policies
  - An Inline Policy is an IAM policy which is actually embedded within the user, group or role to which it applies.
  - There is a strict 1:1 relationship between the entity and the policy.
  - When you delete the user, group or role in which the Inline policy is embedded, the policy will also be deleted
  - In most cases, AWS recommends using Managed Policies over Inline Policies
  - Inline Policies are useful when you want to be sure that the permissions in a policy are not inadvertently assigned to any other user, group or role than the one for which they're intended (i.e- you are creating a policy that must only ever be attached to a single user, group or role)
- EXAM Tips:
  - 3 different types of IAM policies
    - Managed Policy: AWS managed default policies
    - Customer Managed Policy: Managed by you
    - Inline Policy: Managed by you and embeeded in a single user, gorup or role
  - In most cases, AWS recommends using Managed Policies over Inline Policies
